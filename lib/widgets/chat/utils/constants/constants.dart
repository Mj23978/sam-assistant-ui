import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../models/message/message.dart';


const String enUS = "en_US";
const String emojiRegExpression =
    r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])';
const String imageUrlRegExpression =
    r'(http(s?):)([/|.|\w|\s|-])*\.(?:jpg|gif|png|jpeg)';
const String dateFormat = "yyyy-MM-dd";
const String jpg = ".jpg";
const String png = ".png";
const String jpeg = ".jpeg";
const String couldNotLunch = "Could not lunch";
const String profileImage =
    "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202103/photo-1511367461989-f85a21fda1_0_1200x768.jpeg?YVCV8xj2CmtZldc_tJAkykymqxE3fxNf&size=770:433";
const String heart = "\u{2764}";
const String faceWithTears = "\u{1F602}";
const String disappointedFace = "\u{1F625}";
const String angryFace = "\u{1F621}";
const String astonishedFace = "\u{1F632}";
const String thumbsUp = "\u{1F44D}";
const double bottomPadding1 = 10;
const double bottomPadding2 = 22;
const double bottomPadding3 = 12;
const double bottomPadding4 = 6;
const double leftPadding = 9;
const double maxWidth = 350;
const int opacity = 18;
const double verticalPadding = 4.0;
const double leftPadding2 = 5;
const double horizontalPadding = 6;
const double replyBorderRadius1 = 30;
const double replyBorderRadius2 = 18;
const double leftPadding3 = 12;
const double textFieldBorderRadius = 27;

applicationDateFormatter(DateTime inputTime) {
  if (DateTime.now().difference(inputTime).inDays <= 3) {
    return timeago.format(inputTime);
  } else {
    return DateFormat('dd MMM yyyy').format(inputTime);
  }
}

/// Default builder when the message has got seen as of now
/// is visible at the bottom of the chat bubble
Widget lastSeenAgoBuilder(Message message, String formattedDate) {
  return Padding(
    padding: const EdgeInsets.all(2),
    child: Text(
      'Seen ${applicationDateFormatter(message.createdAt)}    ',
      style: const TextStyle(color: Colors.grey, fontSize: 12),
    ),
  );
}
