import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uix/flutter_uix.dart';

import '../../utils/helpers.dart';

class AddCheckBox extends StatelessWidget {
  final bool value;
  final String name;
  final Function1<bool?, void> onSubmit;
  final MainAxisAlignment alignment;
  final bool withText;

  const AddCheckBox({
    Key? key,
    required this.value,
    required this.name,
    required this.onSubmit,
    this.alignment = MainAxisAlignment.center,
    this.withText = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSubmit(!value),
      child: Container(
        child: Row(
          mainAxisAlignment: alignment,
          children: [
            Checkbox(
              value: value,
              onChanged: onSubmit,
              side: BorderSide(width: 2, color: Colors.black),
              activeColor: Colors.green,
            ),
            if (withText) ...[
              5.0.widthBox,
              Text(
                name,
                style: textStyle(context, 14),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
