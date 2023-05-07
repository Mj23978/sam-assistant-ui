import 'package:flutter/material.dart';

import 'sidebar_controller.dart';
import 'sidebar_theme.dart';
import 'utils/types.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({
    Key? key,
    required this.controller,
    this.items = const [],
    this.theme = const SidebarTheme(),
    this.extendedTheme,
    this.headerBuilder,
    this.footerBuilder,
    this.separatorBuilder,
    this.toggleButtonBuilder,
    this.showToggleButton = true,
    this.headerDivider,
    this.footerDivider,
    this.animationDuration = const Duration(milliseconds: 300),
    this.collapseIcon = Icons.arrow_back_ios_new,
    this.extendIcon = Icons.arrow_forward_ios,
  }) : super(key: key);

  /// Default theme of Sidebar
  final SidebarTheme theme;

  /// Theme of extended sidebar
  /// Using [theme] if [extendedTheme] is null
  final SidebarTheme? extendedTheme;

  final List<SidebarCellBuilder> items;

  /// Controller to interact with Sidebar from code
  final SidebarController controller;

  /// Builder for implement custom seporators between [itmes]
  final IndexedWidgetBuilder? separatorBuilder;

  /// Builder for implement your custom Sidebar header
  final SidebarBuilder? headerBuilder;

  /// Builder for implement your custom Sidebar footer
  final SidebarBuilder? footerBuilder;

  /// Builder for toggle button at the bottom of the bar
  final SidebarBuilder? toggleButtonBuilder;

  /// Sidebar showing toggle button if value [true]
  /// not showing if value [false]
  final bool showToggleButton;

  /// Divider between header and [items]
  final Widget? headerDivider;

  /// Divider footer header and [items]
  final Widget? footerDivider;

  /// Togglin animation duration
  final Duration animationDuration;

  ///Collapse Icon
  final IconData collapseIcon;

  ///Extend Icon
  final IconData extendIcon;

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    if (widget.controller.extended) {
      _animationController.forward();
    }
    widget.controller.extendStream.listen(
      (extended) {
        if (_animationController.isCompleted) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        final extendedT = widget.extendedTheme?.mergeWith(widget.theme);
        final selectedTheme = widget.controller.extended
            ? extendedT ?? widget.theme
            : widget.theme;

        final t = selectedTheme.mergeFlutterTheme(context);

        return AnimatedContainer(
          duration: widget.animationDuration,
          width: t.width,
          height: t.height,
          padding: t.padding,
          margin: t.margin,
          decoration: t.decoration,
          child: Column(
            children: [
              widget.headerBuilder?.call(context, widget.controller.extended) ??
                  const SizedBox(),
              widget.headerDivider ?? const SizedBox(),
              Expanded(
                child: ListView.separated(
                  itemCount: widget.items.length,
                  separatorBuilder: widget.separatorBuilder ??
                      (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final item = widget.items[index];
                    return widget.items[index](
                        t,
                        _animationController,
                        widget.controller.extended,
                        widget.controller.selectedIndex == index);
                  },
                ),
              ),
              widget.footerDivider ?? const SizedBox(),
              widget.footerBuilder?.call(context, widget.controller.extended) ??
                  const SizedBox(),
              if (widget.showToggleButton)
                _buildToggleButton(t, widget.collapseIcon, widget.extendIcon),
            ],
          ),
        );
      },
    );
  }

  Widget _buildToggleButton(
    SidebarTheme sidebarXTheme,
    IconData collapseIcon,
    IconData extendIcon,
  ) {
    final buildedToggleButton =
        widget.toggleButtonBuilder?.call(context, widget.controller.extended);
    if (buildedToggleButton != null) {
      return buildedToggleButton;
    }

    return InkWell(
      key: const Key('sidebarx_toggle_button'),
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: () {
        widget.controller.toggleExtended();
      },
      child: Row(
        mainAxisAlignment: widget.controller.extended
            ? MainAxisAlignment.end
            : MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Icon(
              widget.controller.extended ? collapseIcon : extendIcon,
              color: sidebarXTheme.iconTheme?.color,
              size: sidebarXTheme.iconTheme?.size,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
