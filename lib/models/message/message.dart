import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';

import '../chat/chat.dart';
import '../enums.dart';

@Entity()
class Message {
  @Id()
  int id = 0;

  final String message;

  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime createdAt = DateTime.now();

  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime updatedAt = DateTime.now();

  @Transient()
  final GlobalKey key;

  final String sendBy;

  final MessageType messageType;

  @Transient()
  Duration? voiceMessageDuration;

  final chat = ToOne<Chat>();

  Message({
    required this.message,
    required this.sendBy,
    required this.createdAt,
    required this.updatedAt,
    this.messageType = MessageType.text,
    this.voiceMessageDuration,
  })  : key = GlobalKey();
        
}
