import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

import '../../core/providers.dart';
import '../buttons/space_menu_button.dart';

class MenuWithButton extends ConsumerWidget {
  final List<SpaceMenuButton> items;
  final String? title;
  final double width;
  final double addHeight;
  final int numberOfSection;

  const MenuWithButton({
    Key? key,
    required this.items,
    this.title,
    this.width = 200,
    this.addHeight = 0,
    this.numberOfSection = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.watch(homeProvider);
    int section = 0;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: width),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: (items.length * 32) +
                (title != null ? 30 : 10) +
                (numberOfSection * 6) +
                addHeight,
          ),
          child: Column(
            children: [
              SizedBox(height: 6),
              if (title != null) ...[
                Align(
                  alignment: Alignment(-0.8, 0),
                  child: Text(
                    title!,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 8)
              ],
              for (var i = 0; i < items.length; i++) ...[
                ...() {
                  if (items[i].section > section) {
                    section++;
                    return [
                      SizedBox(
                        height: 4,
                      ),
                      Divider(
                        height: 2,
                        thickness: 1.5,
                        indent: 4,
                        endIndent: 4,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                    ];
                  }
                  return [
                    SizedBox(
                      height: 4,
                    )
                  ];
                }(),
                wrapWithMenu(
                  wrap: items[i].subItems.isNotEmpty,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: width),
                    child: TextButton(
                      onPressed: () async {
                        if (items[i].subItems.isNotEmpty) {
                          if (items[i].controller == null) {
                            items[i].controller = JustTheController();
                          }
                          items[i].controller?.showTooltip();
                        }
                        if (items[i].addSwitch == true) {
                          provider.setPopupMenuItemsSwitch(
                            items,
                            i,
                            !items[i].switchValue,
                          );
                        }
                        if (items[i].addSelect == true) {
                          provider.setPopupMenuItemsSelect(
                            items,
                            i,
                            !items[i].selectValue,
                          );
                        }
                      },
                      style: ButtonStyle(
                          // padding: MaterialStateProperty.all(
                          //   EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                          // ),
                          ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...(items[i].prefixWidgets),
                          if (items[i].isNew)
                            Container(
                              margin: EdgeInsets.only(left: 4),
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color:
                                      Colors.purple.shade100.withOpacity(0.7)),
                              child: Text(
                                "New",
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          Spacer(),
                          if (items[i].addSwitch)
                            SizedBox(
                              height: 32,
                              width: 45,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Switch(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: items[i].switchValue,
                                  onChanged: (value) =>
                                      provider.setPopupMenuItemsSwitch(
                                    items,
                                    i,
                                    value,
                                  ),
                                ),
                              ),
                            ),
                          if (items[i].selectValue && items[i].addSelect)
                            Icon(Icons.check, size: 20),
                          ...(items[i].suffixWidgets),
                          if (items[i].subItems.isNotEmpty)
                            Icon(Icons.arrow_forward_ios_rounded, size: 10),
                        ],
                      ),
                    ),
                  ),
                  content: MenuWithButton(
                    items: items[i].subItems,
                    title: items[i].subItemsHeader,
                    width: 185,
                    numberOfSection: items[i].subItems.isNotEmpty
                        ? items[i].subItems.last.section + 1
                        : 1,
                  ),
                  controller: items[i].controller,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

Widget wrapWithMenu({
  bool wrap = true,
  required Widget child,
  required Widget content,
  JustTheController? controller,
  AxisDirection preferredDirection = AxisDirection.right,
  Function()? onDismiss,
}) {
  return wrap
      ? JustTheTooltip(
          onShow: () {},
          onDismiss: onDismiss,
          backgroundColor: Colors.white,
          controller: controller,
          tailLength: 0,
          tailBaseWidth: 0.0,
          isModal: true,
          preferredDirection: preferredDirection,
          margin: EdgeInsets.only(top: 100),
          borderRadius: BorderRadius.circular(8.0),
          offset: 10,
          content: content,
          child: child,
        )
      : child;
}

Widget wrapWithTooltip({
  bool wrap = true,
  required String description,
  required Widget child,
  AxisDirection axis = AxisDirection.up,
}) {
  return wrap
      ? JustTheTooltip(
          content: Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            child: Text(
              description,
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500),
            ),
          ),
          backgroundColor: Colors.black87,
          offset: 0,
          tailBaseWidth: 8,
          tailLength: 4,
          preferredDirection: axis,
          child: child,
        )
      : child;
}
