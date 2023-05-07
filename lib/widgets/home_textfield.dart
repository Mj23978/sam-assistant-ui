import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../utils/helpers.dart';

class HomeTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function1<String, void> submit;
  final FocusNode? focusNode;
  final Color iconColor;

  const HomeTextField({
    Key? key,
    required this.controller,
    required this.submit,
    this.iconColor = Colors.white,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: 'home_name_field'.tr(),
                hintStyle: textStyle(context, 15,
                    color: Colors.white, weight: FontWeight.w500),
              ),
              style: textStyle(context, 14,
                  color: Colors.white, weight: FontWeight.w400),
              textCapitalization: TextCapitalization.words,
              controller: controller,
              onSubmitted: submit,
              focusNode: focusNode,
            ),
          ),
          Container(
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: iconColor,
              ),
              onPressed: () => submit(controller.text),
            ),
          )
        ],
      ),
    );
  }
}
