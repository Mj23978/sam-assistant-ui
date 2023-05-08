import 'package:flutter/material.dart';
import 'package:audio_waveforms/audio_waveforms.dart';

import '../message/message.dart';

class MessageConfiguration {
  /// Provides configuration of image message appearance.
  final ImageMessageConfiguration? imageMessageConfig;

  /// Provides builder to create view for custom messages.
  final Widget Function(Message)? customMessageBuilder;

  /// Configurations for voice message bubble
  final VoiceMessageConfiguration? voiceMessageConfig;

  const MessageConfiguration({
    this.imageMessageConfig,
    this.customMessageBuilder,
    this.voiceMessageConfig,
  });
}


class VoiceMessageConfiguration {
  const VoiceMessageConfiguration({
    this.playerWaveStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    this.margin,
    this.decoration,
    this.animationCurve,
    this.animationDuration,
    this.pauseIcon,
    this.playIcon,
    this.waveformMargin,
    this.waveformPadding,
    this.enableSeekGesture = true,
  });

  final PlayerWaveStyle? playerWaveStyle;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final EdgeInsets? waveformPadding;
  final EdgeInsets? waveformMargin;
  final BoxDecoration? decoration;
  final Duration? animationDuration;
  final Curve? animationCurve;
  final Icon? playIcon;
  final Icon? pauseIcon;
  final bool enableSeekGesture;
}


class ImageMessageConfiguration {

  final ShareIconConfiguration? shareIconConfig;
  final void Function(String)? onTap;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;

  const ImageMessageConfiguration({
    this.shareIconConfig,
    this.onTap,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.borderRadius,
  });
}

class ShareIconConfiguration {

  final void Function(String)? onPressed; // Returns imageURL
  final Widget? icon;
  final Color? defaultIconBackgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? defaultIconColor;

  ShareIconConfiguration({
    this.onPressed,
    this.icon,
    this.defaultIconBackgroundColor,
    this.padding,
    this.margin,
    this.defaultIconColor,
  });
}
