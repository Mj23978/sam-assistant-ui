import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  @Id()
  int id = 0;

  String uuid;

  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime createdAt = DateTime.now();

  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime updatedAt = DateTime.now();

  @Transient() // Ignore this property, not stored in the database.
  int? computedProperty;

  User({
    required this.uuid
  });
}


class ProfileCircleConfiguration {
  /// Used to give padding to profile circle.
  final EdgeInsetsGeometry? padding;

  /// Provides image url of user
  final String? profileImageUrl;

  /// Used for give bottom padding to profile circle
  final double? bottomPadding;

  /// Used for give circle radius to profile circle
  final double? circleRadius;

  /// Provides callback when user tap on profile circle.
  final void Function(User)? onAvatarTap;

  /// Provides callback when user long press on profile circle.
  final void Function(User)? onAvatarLongPress;

  const ProfileCircleConfiguration({
    this.onAvatarTap,
    this.padding,
    this.profileImageUrl,
    this.bottomPadding,
    this.circleRadius,
    this.onAvatarLongPress,
  });
}
