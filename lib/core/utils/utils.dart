import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timeago/timeago.dart' as timeago;

String getRelativeTime(String isoDate) {
  final dateTime = DateTime.parse(isoDate);
  return timeago.format(dateTime);
}

buildGetPage(Widget route) {
  return Get.to(() => route,
    transition: Transition.rightToLeftWithFade,
    duration: const Duration(milliseconds: 500),
  );
}


void shareApp() {
  SharePlus.instance.share(
    ShareParams(
      title: 'Astrology App',
      text: 'Check out this awesome astrology app! 🔮\nhttps://yourapp.link',
      subject: "Share Astrology App"
    )
  );
}

