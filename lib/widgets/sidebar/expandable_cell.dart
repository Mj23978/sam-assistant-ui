import 'dart:math' as math;

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import './sidebar_theme.dart';

class ExpandableCell extends StatefulWidget {
  const ExpandableCell({
    Key? key,
    required this.extended,
    required this.selected,
    required this.theme,
    required this.onTap,
    required this.animationController,
    required this.items,
    this.iconWidget,
    this.label,
    this.icon,
  }) : super(key: key);

  final bool extended;
  final bool selected;
  final IconData? icon;
  final String? label;
  final Widget? iconWidget;
  final List<Widget>? items;
  final SidebarTheme theme;
  final VoidCallback onTap;
  final AnimationController animationController;

  @override
  State<ExpandableCell> createState() => _ExpandableCellState();
}

class _ExpandableCellState extends State<ExpandableCell> {
  late Animation<double> _animation;
  var _hovered = false;

  @override
  void initState() {
    super.initState();
    _animation = CurvedAnimation(
      parent: widget.animationController,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme;
    final iconTheme =
        widget.selected ? theme.selectedIconTheme : theme.iconTheme;
    final textStyle =
        widget.selected ? theme.selectedTextStyle : theme.textStyle;
    final decoration =
        (widget.selected ? theme.selectedItemDecoration : theme.itemDecoration);
    final margin =
        (widget.selected ? theme.selectedItemMargin : theme.itemMargin);
    final padding =
        (widget.selected ? theme.selectedItemPadding : theme.itemPadding);
    final textPadding =
        widget.selected ? theme.selectedItemTextPadding : theme.itemTextPadding;

    return MouseRegion(
      onEnter: (_) => _onEnteredCellZone(),
      onExit: (_) => _onExitCellZone(),
      cursor: SystemMouseCursors.click,
      child: ExpandableNotifier(
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            decoration: decoration?.copyWith(
              color: _hovered && !widget.selected ? theme.hoverColor : null,
            ),
            padding: padding ?? const EdgeInsets.all(8),
            margin: margin ?? const EdgeInsets.all(4),
            child: ScrollOnExpand(
              child: Column(
                children: <Widget>[
                  ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToExpand: false,
                      tapBodyToCollapse: false,
                      useInkWell: false,
                      hasIcon: false,
                    ),
                    collapsed: _buildItems(widget.items),
                    header: Row(
                      mainAxisAlignment: widget.extended
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.center,
                      children: [
                        Opacity(
                          opacity: (widget.items?.length ?? 0) == 0 ? 0 : 1,
                          child: ExpandableIcon(
                            theme: const ExpandableThemeData(
                              expandIcon: Icons.arrow_right,
                              collapseIcon: Icons.arrow_drop_down,
                              iconColor: Colors.white,
                              iconSize: 10.0,
                              iconRotationAngle: math.pi / 2,
                              iconPadding: EdgeInsets.only(right: 5),
                              hasIcon: true,
                            ),
                          ),
                        ),
                        AnimatedBuilder(
                          animation: _animation,
                          builder: (context, _) {
                            final value = ((1 - _animation.value) * 6).toInt();
                            if (value <= 0) {
                              return const SizedBox();
                            }
                            return Spacer(flex: value);
                          },
                        ),
                        if (widget.icon != null)
                          _Icon(icon: widget.icon!, iconTheme: iconTheme)
                        else if (widget.iconWidget != null)
                          widget.iconWidget!,
                        Flexible(
                          flex: 6,
                          child: FadeTransition(
                            opacity: _animation,
                            child: Padding(
                              padding: textPadding ?? EdgeInsets.zero,
                              child: Text(
                                widget.label ?? '',
                                style: textStyle,
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    expanded: Container(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onEnteredCellZone() {
    setState(() => _hovered = true);
  }

  void _onExitCellZone() {
    setState(() => _hovered = false);
  }

  Widget _buildItems(List<Widget>? items) {
    if (items == null) {
      return Container();
    }
    return Column(children: [...items.map((e) => Container())]);
  }
}

class _Icon extends StatelessWidget {
  const _Icon({
    Key? key,
    required this.icon,
    required this.iconTheme,
  }) : super(key: key);

  final IconData icon;
  final IconThemeData? iconTheme;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: iconTheme?.color,
      size: iconTheme?.size,
    );
  }
}
