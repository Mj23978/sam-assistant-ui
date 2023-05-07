import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import '../../objectbox.g.dart';

import '../../widgets/buttons/space_menu_button.dart';
import 'app_provider.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider(this.appProvider);

  final AppProvider appProvider;


  bool titleHovered = false;
  bool sidebarHovered = false;
  bool sideSearchHovered = false;
  JustTheController sidebarSettingsMenuController = JustTheController();

  bool settingsSwitch = false;
  bool pinFavorites = true;


  toggleSwitch(bool value) {
    settingsSwitch = value;
    notifyListeners();
  }

  togglePinFavorites() {
    pinFavorites = !pinFavorites;
    notifyListeners();
  }

  setPopupMenuItemsSwitch(List<SpaceMenuButton> items, int index, bool value) {
    items[index].switchValue = value;
    notifyListeners();
  }

  setPopupMenuItemsSelect(List<SpaceMenuButton> items, int index, bool value) {
    items[index].selectValue = value;
    notifyListeners();
  }


  onHoverSidebar(bool value) {
    sidebarHovered = value;
    notifyListeners();
  }

  onTiltleHovered(bool value) {
    titleHovered = value;
    notifyListeners();
  }

  onSideSearchHovered(bool value) {
    sideSearchHovered = value;
    notifyListeners();
  }
}

