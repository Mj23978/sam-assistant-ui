import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class RoleGridItem extends StatelessWidget {
  final Function0<void> onLongPress;
  final Function1<bool?, void> onChanged;
  final String text;
  final TextStyle textStyle;
  final bool value;
  final int index;
  final Color color;
  final LinearGradient gradient;

  const RoleGridItem({
    Key? key,
    required this.onLongPress,
    required this.onChanged,
    required this.text,
    required this.gradient,
    required this.textStyle,
    required this.value,
    required this.index,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      onLongPress: onLongPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          gradient: gradient,
          border: Border.all(width: 1.0, color: const Color(0xff707070)),
        ),
        child: Row(
          children: [
            Checkbox(
              value: value,
              onChanged: onChanged,
              side: BorderSide(width: 2, color: Colors.white),
              activeColor: color,
              // activeColor: Colors.black,
            ),
            AutoSizeText(
              text,
              style: textStyle,
              maxFontSize: 16,
              minFontSize: 12,
            ),
          ],
        ),
      ),
    );
  }
}
