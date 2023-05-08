import 'dart:io' if (kIsWeb) 'dart:html';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';

class ChatViewAppBar extends StatelessWidget {
  const ChatViewAppBar({
    Key? key,
    required this.chatTitle,
    this.backGroundColor,
    this.userStatus,
    this.profilePicture,
    this.chatTitleTextStyle,
    this.userStatusTextStyle,
    this.backArrowColor,
    this.actions,
    this.elevation,
    this.padding,
    this.leading,
    this.showLeading = true,
  }) : super(key: key);

  final Color? backGroundColor;
  final String chatTitle;
  final String? userStatus;
  final String? profilePicture;
  final TextStyle? chatTitleTextStyle;
  final TextStyle? userStatusTextStyle;
  final Color? backArrowColor;
  final List<Widget>? actions;
  final double? elevation;
  final EdgeInsets? padding;
  final Widget? leading;
  final bool showLeading;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? 0,
      child: Container(
        padding: padding ??
            EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 8,
              bottom: 4,
              left: 12,
              right: 12
            ),
        color: backGroundColor ?? Colors.transparent,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  if (profilePicture != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: CircleAvatar(
                          backgroundImage: NetworkImage(profilePicture!)),
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chatTitle,
                        style: chatTitleTextStyle ??
                            const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.25,
                            ),
                      ),
                      if (userStatus != null)
                        Text(
                          userStatus!,
                          style: userStatusTextStyle,
                        ),
                    ],
                  ),
                ],
              ),
            ),
            if (actions != null) ...actions!,
          ],
        ),
      ),
    );
  }
}
