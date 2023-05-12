import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:sam_assistant/models/message/message.dart';
import 'package:sam_assistant/widgets/markdown_custom/markdown_themes.dart';
import 'package:uuid/uuid.dart';

import '../../generated/chat.pb.dart';
import '../../main.dart';
import '../../models/chat/chat.dart';
import '../../objectbox.g.dart';
import '../../widgets/buttons/space_menu_button.dart';
import 'app_provider.dart';

class HomeProvider extends ChangeNotifier {
  final List<Chat> userChats = [];
  final AppProvider appProvider;
  late Chat mainChat;
  Box<Chat> chatBox = objectbox.store.box<Chat>();

  HomeProvider(this.appProvider) {
    final allChats = chatBox.getAll();
    if (allChats.isEmpty) {
      addUserChat();
    } else {
      mainChat = allChats.last;
      userChats.addAll(allChats);
    }
  }

  bool titleHovered = false;
  bool sidebarHovered = false;
  bool sideSearchHovered = false;
  bool chatOptionsCollapsed = true;
  TextEditingController homeTextFieldController = TextEditingController();
  JustTheController sidebarSettingsMenuController = JustTheController();

  bool settingsSwitch = false;
  bool pinFavorites = true;

  void toggleSwitch(bool value) {
    settingsSwitch = value;
    notifyListeners();
  }

  void toggleChatOptions() {
    chatOptionsCollapsed = !chatOptionsCollapsed;
    notifyListeners();
  }

  void togglePinFavorites() {
    pinFavorites = !pinFavorites;
    notifyListeners();
  }

  void setPopupMenuItemsSwitch(
      List<SpaceMenuButton> items, int index, bool value) {
    items[index].switchValue = value;
    notifyListeners();
  }

  void setPopupMenuItemsSelect(
      List<SpaceMenuButton> items, int index, bool value) {
    items[index].selectValue = value;
    notifyListeners();
  }

  void onHoverSidebar(bool value) {
    sidebarHovered = value;
    notifyListeners();
  }

  void onTiltleHovered(bool value) {
    titleHovered = value;
    notifyListeners();
  }

  void onSideSearchHovered(bool value) {
    sideSearchHovered = value;
    notifyListeners();
  }

  Chat getMainChat() {
    if (mainChat == null) {
      final chat = chatBox.query().order(Chat_.updatedAt).build().findFirst();
      return chat!;
    } else {
      return mainChat;
    }
  }

  void setMainChat(Chat chat) {
    mainChat = chat;
  }

  Chat _addchat() {
    final chat = Chat(
      title: "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      chatId: const Uuid().v4(),
    );
    chatBox.put(chat);
    userChats.add(chat);
    mainChat = chat;
    return chat;
  }

  Chat addUserChat({bool force = false}) {
    if (!force && (mainChat.title == "" || mainChat.messages.isEmpty)) {
      return mainChat;
    } else {
      return _addchat();
    }
  }

  int deleteUserChats() {
    final count = chatBox.removeAll();
    userChats.clear();
    addUserChat();
    return count;
  }

  void deleteChat(Chat chat) {
    chatBox.remove(chat.id);
    userChats.remove(chat);
    if (mainChat == chat) {
      mainChat = userChats.last;
    }
  }

  SamMarkdownThemes appMarkdownTheme() {
    return findMarkdownTheme(appProvider.appSettings.markdownTheme);
  }

  SamMarkdownThemes findMarkdownTheme(String? themeName) {
    return samMarkdownThemes.firstWhere(
      (element) => element.themeName == themeName,
      orElse: () => samMarkdownThemes.first,
    );
  }

  Message addMessagetoMainChat(String from, String response) {
    final message = Message(
      message: response,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      sendBy: from,
      chat: ToOne(target:  mainChat)
    );
    mainChat.messages.add(message);
    chatBox.put(mainChat);
    notifyListeners();
    return message;
  }
}
