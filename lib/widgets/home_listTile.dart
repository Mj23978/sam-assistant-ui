import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

class HomeListTile extends StatelessWidget {
  final Function1<bool?, void> onCheck;
  final Function0<void> delete;
  final bool value;
  final Widget text;

  const HomeListTile({
    Key? key,
    required this.onCheck,
    required this.delete,
    required this.value,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      hoverColor: Colors.black,
      enabled: true,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(100.0),
      //   side: BorderSide(color: Colors.black, width: 1),
      // ),
      leading: Checkbox(
        activeColor: Color(0xff3D79BE),
        side: BorderSide(width: 2, color: Colors.black),
        onChanged: onCheck,
        value: value,
      ),
      title: Center(
        child: text,
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.cancel_presentation_rounded,
          color: Colors.red,
        ),
        onPressed: delete,
      ),
    );
  }
}
