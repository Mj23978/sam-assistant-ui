import 'package:flutter/material.dart';

class ExpandableSection extends StatefulWidget {
  final String title;
  final Widget content;

  const ExpandableSection(
      {super.key, required this.title, required this.content});

  @override
  _ExpandableSectionState createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //       body: new Center(
        //   child: new Container(
        //     child: new Material(
        //       child: new InkWell(
        //         onTap: (){print("tapped");},
        //         child: new Container(
        //           width: 100.0,
        //           height: 100.0,
        //         ),
        //       ),
        //       color: Colors.transparent,
        //     ),
        //     color: Colors.orange,
        //   ),
        // ),
        Material(
          color: const Color(0xff4A4A4A).withOpacity(0.4),
          borderRadius: BorderRadius.circular(2),
          child: InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            splashColor: const Color(0xff4A4A4A),
            splashFactory: InkRipple.splashFactory,
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  Icon(
                    _isExpanded ? Icons.arrow_drop_down : Icons.arrow_right,
                    color: const Color(0xffE2E2E2),
                  ),
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xffE2E2E2),
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: _isExpanded ? null : 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: widget.content,
          ),
        ),
      ],
    );
  }
}
