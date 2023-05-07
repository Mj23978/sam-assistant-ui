import 'package:flutter/cupertino.dart';
import 'package:objectbox/objectbox.dart';

import '../../models/settings/settings.dart';

class AppProvider extends ChangeNotifier {
  late Settings appSettings;

  setDatabase(Settings settings) async {
    appSettings = settings;
    notifyListeners();
  }

  var roles = <String>[];

  close() async {}
}
