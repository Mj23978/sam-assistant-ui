import 'package:objectbox/objectbox.dart';

import '../message/message.dart';

@Entity()
class Chat {
  @Id()
  int id = 0;

  final String title;

  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime createdAt = DateTime.now();

  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime updatedAt = DateTime.now();

  final String chatId;

  @Backlink("chat")
  final messages = ToMany<Message>();

  Chat({
    required this.chatId,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });
}
