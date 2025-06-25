import 'package:url_launcher/url_launcher.dart';

import 'custom_snak_bar.dart';

Future<void> launchCustomUr(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      customShowSnakBar(context, "Can not launch $url");
    }
  }
}
