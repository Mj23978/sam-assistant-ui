import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

import '../../core/providers.dart';
import '../../widgets/buttons/space_menu_button.dart';
import '../../widgets/overlays/menu_with_buttons.dart';

class SidebarWidgets extends HookConsumerWidget {
  const SidebarWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.watch(homeProvider);
    return TextButton(
      onHover: provider.onHoverSidebar,
      style: ButtonStyle(
        mouseCursor: MaterialStateProperty.all(MouseCursor.defer),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      onPressed: () {},
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xff121212),
        ),
        height: double.maxFinite,
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          children: [
            Material(
              type: MaterialType.transparency,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/app-logo.svg',
                      height: 16,
                      width: 16,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Sam Assistant",
                      style: GoogleFonts.gemunuLibre(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    if (provider.sidebarHovered ||
                        provider.sidebarSettingsMenuController.value ==
                            TooltipStatus.isShowing)
                      JustTheTooltip(
                        onShow: () {},
                        onDismiss: () {},
                        backgroundColor: Colors.white,
                        tailLength: 0,
                        tailBaseWidth: 0.0,
                        isModal: true,
                        preferredDirection: AxisDirection.down,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 10),
                        borderRadius: BorderRadius.circular(8.0),
                        offset: 10,
                        content: MenuWithButton(
                          items: sidebarSettingsPopupItems,
                          title: "Sidebar Settings",
                        ),
                        controller: provider.sidebarSettingsMenuController,
                        child: InkWell(
                          onTap: () {
                            provider.sidebarSettingsMenuController
                                .showTooltip();
                          },
                          onHover: (value) {},
                          hoverColor: Colors.blue.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(3),
                          child: Icon(
                            Icons.settings,
                            color: Colors.teal.shade700,
                            size: 18,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                  color: Colors.blueGrey.shade800,
                  borderRadius: BorderRadius.circular(5)),
              child: TextButton(
                onPressed: () {},
                onHover: provider.onSideSearchHovered,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: 18,
                        color: provider.sideSearchHovered
                            ? Colors.blue
                            : Colors.black45,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "Search",
                        style: TextStyle(
                            color: provider.sideSearchHovered
                                ? Colors.blue
                                : Colors.black45,
                            fontSize: 12),
                      ),
                      const Spacer(),
                      Text(
                        "Ctrl+K",
                        style: TextStyle(
                            color: provider.sideSearchHovered
                                ? Colors.blue
                                : Colors.black45,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ...provider.userChats.map<Widget>((value) {
              return SideMenuSimpleItem(
                name: value.title,
                onPressed: () {
                  provider.setMainChat(value);
                },
              );
            }).toList(),
            SideMenuSimpleItem(
              name: "Add Chat",
              backgroundColor: Colors.black,
              alignment: Alignment.center,
              iconData: Icons.add,
              onPressed: () {
                provider.addUserChat();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SideMenuSimpleItem extends StatelessWidget {
  final String name;
  final IconData? iconData;
  final double? iconSize;
  final Color? backgroundColor;
  final Widget? icon;
  final Alignment? alignment;
  final void Function()? onPressed;
  final void Function(bool)? onHover;

  const SideMenuSimpleItem({
    Key? key,
    required this.name,
    this.backgroundColor,
    this.alignment,
    this.iconData,
    this.onPressed,
    this.onHover,
    this.iconSize = 18,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      onHover: onHover,
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: const BorderSide(color: Colors.transparent),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
              backgroundColor ?? Colors.transparent)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
        alignment: alignment,
        child: Row(
          children: [
            if (iconData != null)
              Icon(
                iconData,
                size: iconSize,
                color: Colors.blueGrey,
              ),
            if (icon != null) ...[icon!, const SizedBox(width: 5)],
            Flexible(
              flex: 1,
              child: Container(
                alignment: alignment,
                child: Text(
                  name,
                  style: const TextStyle(color: Colors.blueGrey, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                  // softWrap: false,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
