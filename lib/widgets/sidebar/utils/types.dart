import 'package:flutter/material.dart';
import '../sidebar.dart';

/// Default builder method for sidebar elements building
typedef SidebarBuilder = Widget Function(BuildContext context, bool extended);
typedef SidebarCellBuilder = Widget Function(SidebarTheme theme, AnimationController ac, bool extended, bool selected);