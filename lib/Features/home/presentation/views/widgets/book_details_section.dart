import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 240,
            child: const CustomBookImage(
              imageUrl:
                  "https://plus.unsplash.com/premium_photo-1674389991678-0836ca77c7f7?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            ),
          ),
        ),
        const SizedBox(height: 43),
        const Text("The Jungle Book", style: Styles.textStyle30),
        const SizedBox(height: 6),
        Opacity(
          opacity: .7,
          child: Text(
            "Rudyard Kipling",
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 18),
        BookRating(
          rating: 5,
          count: 265,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 37),
        const BooksAction(),
      ],
    );
  }
}
