import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:uuid/uuid.dart';

import '../../main.dart';
import '../../models/settings/settings.dart';
import '../../models/user/user.dart';

class AppProvider extends ChangeNotifier {
  late Settings appSettings;
  late User? mainUser;

  AppProvider() {
    Box<User> userBox = objectbox.store.box<User>();
    Box<Settings> conf = objectbox.store.box<Settings>();
    if (userBox.count() == 0) {
      User user = User(uuid: const Uuid().v4());
      userBox.put(user);
    }
    mainUser = userBox.getAll().first;
    if (conf.count() == 0) {
      final setting = Settings(const Locale("fa", "IR").toString());
      conf.put(setting);
      appSettings = setting;
    }
    appSettings = conf.getAll().first;
  }

  setDatabase(Settings settings) async {
    appSettings = settings;
    notifyListeners();
  }

  setMarkdownTheme(String theme) async {
    Box<Settings> settingBox = objectbox.store.box<Settings>();
    final settings = settingBox.getAll().first;
    settings.markdownTheme = theme;
    settingBox.put(settings, mode: PutMode.update);
    notifyListeners();
  }

  var roles = <String>[];

  close() async {}
}
