import 'package:flutter/material.dart';

class SidebarTheme {
  const SidebarTheme({
    this.width = 70,
    this.height = double.infinity,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.decoration,
    this.iconTheme,
    this.selectedIconTheme,
    this.textStyle,
    this.selectedTextStyle,
    this.itemDecoration,
    this.selectedItemDecoration,
    this.itemMargin,
    this.selectedItemMargin,
    this.itemPadding,
    this.selectedItemPadding,
    this.itemTextPadding,
    this.selectedItemTextPadding,
    this.hoverColor,
  });

  /// [Sidebar] width
  final double width;

  /// [Sidebar] height
  final double height;

  /// [Sidebar] padding
  final EdgeInsets padding;

  /// [Sidebar] margin
  final EdgeInsets margin;

  /// [Sidebar] decoration
  final BoxDecoration? decoration;

  /// Unselected [SidebarItem] icons theme
  final IconThemeData? iconTheme;

  /// Selected [SidebarItem] icon theme
  final IconThemeData? selectedIconTheme;

  /// Unselected [SidebarItem] text style
  final TextStyle? textStyle;

  /// Selected [SidebarItem] text  style
  final TextStyle? selectedTextStyle;

  /// Unselected item [SidebarItem] decoration
  final BoxDecoration? itemDecoration;

  /// Selected item [SidebarItem] decoration
  final BoxDecoration? selectedItemDecoration;

  /// Unselected item [SidebarItem] marging
  final EdgeInsets? itemMargin;

  /// Selected item [SidebarItem] marging
  final EdgeInsets? selectedItemMargin;

  /// Unselected item [SidebarItem] padding
  final EdgeInsets? itemPadding;

  /// Selected item [SidebarItem] padding
  final EdgeInsets? selectedItemPadding;

  /// Unselected item [SidebarItem] text padding
  final EdgeInsets? itemTextPadding;

  /// Selected item [SidebarItem] text padding
  final EdgeInsets? selectedItemTextPadding;

  /// Background color of [SidebarItem] when the mouse
  /// cursor hover over an item
  final Color? hoverColor;

  /// Method to get default flutter theme settings
  SidebarTheme mergeFlutterTheme(BuildContext context) {
    final theme = Theme.of(context);
    final mergedTheme = SidebarTheme(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: decoration ?? BoxDecoration(color: theme.cardColor),
      iconTheme: iconTheme ?? theme.iconTheme,
      selectedIconTheme: selectedIconTheme ??
          theme.iconTheme.copyWith(color: theme.primaryColor),
      textStyle: textStyle ?? theme.textTheme.bodyMedium,
      selectedTextStyle: selectedTextStyle ??
          theme.textTheme.bodyMedium?.copyWith(color: theme.primaryColor),
      itemDecoration: itemDecoration,
      selectedItemDecoration: selectedItemDecoration,
      itemMargin: itemMargin,
      selectedItemMargin: selectedItemMargin,
      itemPadding: itemPadding,
      selectedItemPadding: selectedItemPadding,
      itemTextPadding: itemTextPadding,
      selectedItemTextPadding: selectedItemTextPadding,
      hoverColor: hoverColor ?? theme.hoverColor,
    );
    return mergedTheme;
  }

  /// Merges two themes together
  SidebarTheme mergeWith(
    SidebarTheme theme,
  ) {
    return SidebarTheme(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      itemTextPadding: itemTextPadding ?? theme.itemTextPadding,
      selectedItemTextPadding:
          selectedItemTextPadding ?? theme.selectedItemTextPadding,
      decoration: decoration ?? theme.decoration,
      iconTheme: iconTheme ?? theme.iconTheme,
      selectedIconTheme: selectedIconTheme ?? theme.selectedIconTheme,
      textStyle: textStyle ?? theme.textStyle,
      selectedTextStyle: selectedTextStyle ?? theme.selectedTextStyle,
      itemMargin: itemMargin ?? theme.itemMargin,
      selectedItemMargin: selectedItemMargin ?? theme.selectedItemMargin,
      itemPadding: itemPadding ?? theme.itemPadding,
      selectedItemPadding: selectedItemPadding ?? theme.selectedItemPadding,
      itemDecoration: itemDecoration ?? theme.itemDecoration,
      selectedItemDecoration:
          selectedItemDecoration ?? theme.selectedItemDecoration,
      hoverColor: hoverColor ?? theme.hoverColor,
    );
  }

  /// Defautl copyWith method
  SidebarTheme copyWith({
    double? width,
    double? height,
    EdgeInsets? padding,
    EdgeInsets? margin,
    BoxDecoration? decoration,
    IconThemeData? iconTheme,
    IconThemeData? selectedIconTheme,
    TextStyle? textStyle,
    TextStyle? selectedTextStyle,
    BoxDecoration? itemDecoration,
    BoxDecoration? selectedItemDecoration,
    EdgeInsets? itemMargin,
    EdgeInsets? selectedItemMargin,
    EdgeInsets? itemPadding,
    EdgeInsets? selectedItemPadding,
    EdgeInsets? itemTextPadding,
    EdgeInsets? selectedItemTextPadding,
    Color? hoverColor,
  }) {
    return SidebarTheme(
      width: width ?? this.width,
      height: height ?? this.height,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      decoration: decoration ?? this.decoration,
      iconTheme: iconTheme ?? this.iconTheme,
      selectedIconTheme: selectedIconTheme ?? this.selectedIconTheme,
      textStyle: textStyle ?? this.textStyle,
      selectedTextStyle: selectedTextStyle ?? this.selectedTextStyle,
      itemDecoration: itemDecoration ?? this.itemDecoration,
      selectedItemDecoration:
          selectedItemDecoration ?? this.selectedItemDecoration,
      itemMargin: itemMargin ?? this.itemMargin,
      selectedItemMargin: selectedItemMargin ?? this.selectedItemMargin,
      itemPadding: itemPadding ?? this.itemPadding,
      selectedItemPadding: selectedItemPadding ?? this.selectedItemPadding,
      itemTextPadding: itemTextPadding ?? this.itemTextPadding,
      selectedItemTextPadding:
          selectedItemTextPadding ?? this.selectedItemTextPadding,
      hoverColor: hoverColor ?? this.hoverColor,
    );
  }
}
