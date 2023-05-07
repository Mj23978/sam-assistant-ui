import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uix/flutter_uix.dart';
import '../utils/extensions.dart';

class GameListTile extends StatelessWidget {
  final Function1<bool?, void> onCheck;
  final bool value;
  final Widget playerText;
  final Widget roleText;
  final bool showRole;

  const GameListTile({
    Key? key,
    required this.onCheck,
    required this.value,
    required this.roleText,
    required this.playerText,
    required this.showRole,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onCheck,
            side: BorderSide(width: 2, color: Colors.red),
            activeColor: Colors.red,
          ).pSy(x: 6.0, y: 8.0).flex(3),
          Align(
            alignment: Alignment(-0.5, 0),
            child: playerText,
          ).flex(14),
          Icon(Icons.arrow_forward_outlined).flex(3),
          Align(
            alignment: Alignment(0.55, 0),
            child: roleText,
          ).opacity(showRole ? 0.99 : 0.01).flex(12),
        ],
      ),
    );
  }
}
