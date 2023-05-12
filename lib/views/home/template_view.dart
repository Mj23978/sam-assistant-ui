import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uix/flutter_uix.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:sam_assistant/generated/chat.pb.dart';
import 'package:super_clipboard/super_clipboard.dart';

import '../../core/providers.dart';
import '../../utils/helpers.dart';
import '../../widgets/chat/chat_textfield_configs.dart';
import '../../widgets/chat/chat_view_appbar.dart';
import '../../widgets/chat/chatui_textfield.dart';
import '../../widgets/expandable_section.dart';
import '../../widgets/markdown_custom/markdown_themes.dart';

class SpaceTemplateView extends ConsumerWidget {
  const SpaceTemplateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.watch(homeProvider);
    final grpc = ref.watch(chatServerProvider);
    return Column(
      children: [
        const HomeAppbar(),
        Expanded(
          child: Container(
            color: const Color(0xff101010),
            child: Column(
              children: [
                const Flexible(
                  flex: 20,
                  child: ChatView(),
                ),
                Container(
                  alignment: Alignment.center,
                  child: ChatUITextField(
                    focusNode: FocusNode(),
                    onImageSelected: (v1, v2) {
                      print(v1);
                    },
                    sendMessageConfig: SendMessageConfiguration(
                      textFieldBackgroundColor: const Color(0xff121212),
                      textFieldConfig: TextFieldConfiguration(
                        borderRadius: BorderRadius.zero,
                        textStyle: textStyle(context, 14, color: Colors.white),
                      ),
                    ),
                    onPressed: () async {
                      provider.addMessagetoMainChat(
                          "user", provider.homeTextFieldController.text);
                      final response = await grpc
                          .sendMessage(provider.homeTextFieldController.text);
                      response.fold(
                        (CompleteResponse response) {
                          provider.addMessagetoMainChat(
                              "bot", response.message);
                          print(response);
                        },
                        (String error) {},
                      );
                      if (response.isLeft()) {}
                      provider.homeTextFieldController.clear();
                    },
                    onRecordingComplete: (str) {},
                    textEditingController: provider.homeTextFieldController,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ChatView extends HookConsumerWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(homeProvider);
    return Row(
      children: [
        const Flexible(
          flex: 8,
          child: ChatMessageView(),
        ),
        Flexible(
          flex: provider.chatOptionsCollapsed ? 0 : 4,
          child: const ChatOptionsView(),
        )
      ],
    );
  }
}

class ChatOptionsView extends HookConsumerWidget {
  const ChatOptionsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(homeProvider);

    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      padding: provider.chatOptionsCollapsed
          ? null
          : const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xff121212),
        border: provider.chatOptionsCollapsed
            ? null
            : const Border(
                bottom: BorderSide(color: Colors.white12),
                top: BorderSide(color: Colors.white12),
                left: BorderSide(color: Colors.white12),
                right: BorderSide(
                  style: BorderStyle.none,
                  color: Colors.purple,
                ),
              ),
      ),
      child: provider.chatOptionsCollapsed
          ? null
          : SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ExpandableSection(
                      title: "Model",
                      content: Container(
                        height: 100,
                        color: Colors.red,
                      ),
                    ).pSy(y: 3),
                    ExpandableSection(
                      title: "Agents",
                      content: Container(
                        height: 100,
                        color: Colors.red,
                      ),
                    ).pSy(y: 3),
                    ExpandableSection(
                      title: "Tools",
                      content: Container(
                        height: 100,
                        color: Colors.red,
                      ),
                    ).pSy(y: 3),
                    ExpandableSection(
                      title: "Prompts",
                      content: Container(
                        height: 100,
                        color: Colors.red,
                      ),
                    ).pSy(y: 3),
                  ],
                ),
              ),
            ),
    );
  }
}

class ChatMessageView extends ConsumerWidget {
  const ChatMessageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(homeProvider);
    return ListView(
      // reverse: true,
      children: [
        ...provider.mainChat.messages.map<Widget>((element) {
          return SizedBox(
            height: estimateNumberOfLines(element.message) * 40,
            child: MessageWidget(
              text: element.message,
              color: const Color(0xff444654),
              isSender: false,
              sent: true,
              seen: true,
              textStyle: const TextStyle(
                color: Color(0xffD1D5DB),
                fontSize: 16,
              ),
            ),
          );
        })
      ],
    );
  }
}

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    this.isSender = true,
    required this.text,
    this.color = Colors.blueGrey,
    this.sent = false,
    this.delivered = false,
    this.seen = false,
    this.textStyle = const TextStyle(
      color: Colors.black87,
      fontSize: 16,
    ),
    super.key,
  });

  final bool isSender;
  final String text;
  final Color color;
  final bool sent;
  final bool delivered;
  final bool seen;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6)
      ),
      child: Consumer(builder: (context, ref, child) {
        final provider = ref.watch(homeProvider);
        final app = ref.watch(appProvider);
        return MarkdownWidget(
          physics: const NeverScrollableScrollPhysics(),
          data: text,
          config: MarkdownConfig(
            configs: [
              PreConfig(
                theme: provider
                    .findMarkdownTheme(app.appSettings.markdownTheme)
                    .theme,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color.fromARGB(255, 208, 202, 202),
                ),
                // textStyle: textStyle,
                wrapper: (child, code) {
                  return Stack(
                    children: [
                      child,
                      Positioned(
                        top: 15,
                        right: 20,
                        child: TextButton(
                          onPressed: () async {
                            print("cop");
                            final item = DataWriterItem();
                            item.add(Formats.plainText(code));
                            await ClipboardWriter.instance.write([item]);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Text copied to clipboard'),
                                duration: Duration(milliseconds: 400),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text("Copy"),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              // const HrConfig(
              //   color: Colors.cyanAccent,
              // ),
              PConfig(
                textStyle: textStyle,
              )
            ],
          ),
        );
      }),
    ).pSy(x: 12, y: 4);
  }
}

class HomeAppbar extends HookConsumerWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(homeProvider);
    return Container(
      alignment: Alignment.center,
      child: ChatViewAppBar(
        chatTitle: "Samochat Title",
        chatTitleTextStyle:
            textStyle(context, 18, weight: FontWeight.w600, color: Colors.grey),
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        backGroundColor: const Color(0xff121212),
        elevation: 0,
        actions: [
          Container(
            width: 200,
            // height: 50,
            margin: const EdgeInsets.only(right: 20),
            child: DropdownSearch<String>(
              popupProps: const PopupProps.menu(
                showSelectedItems: true,
              ),
              items: samMarkdownThemes.map<String>((e) => e.themeName).toList(),
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Markdown theme",
                  labelStyle: textStyle(context, 10, color: Colors.white38),
                  hintText: "themes for markdown shown",
                  hintStyle: textStyle(context, 12, color: Colors.white38),
                ),
                baseStyle: textStyle(context, 12, color: Colors.white),
              ),
              onChanged: (value) {
                print(value);
                if (value != null && value.isNotEmpty) {
                  provider.appProvider.setMarkdownTheme(value);
                }
              },
              selectedItem: provider.appMarkdownTheme().themeName,
            ),
          ),
          InkWell(
            onTap: () {
              provider.toggleChatOptions();
            },
            hoverColor: Colors.blue.withOpacity(0.15),
            onHover: (value) {},
            borderRadius: BorderRadius.circular(3),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              child: Icon(
                provider.chatOptionsCollapsed
                    ? Icons.keyboard_double_arrow_left_sharp
                    : Icons.keyboard_double_arrow_right_sharp,
                color: Colors.blue,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
