import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;
  const Failures(this.errorMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerFailure("Bad certificate from ApiServer");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode ?? 0,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure("Request to ApiServer was cancelled");
      case DioExceptionType.connectionError:
        return ServerFailure("Connection error with ApiServer");
      case DioExceptionType.unknown:
        if (dioError.message?.contains("SocketExcepyion") ?? false) {
          return ServerFailure("No Internet Connection");
        }
        return ServerFailure("Unexpected Error, Please try later! ");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
        response?['error']?['message'] ?? 'Unexpected error',
      );
    } else if (statusCode == 404) {
      return ServerFailure("Your request not found, Please try later!");
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server error, Please try later!");
    } else {
      return ServerFailure("Opps There was an Error, Please try again");
    }
  }
}
