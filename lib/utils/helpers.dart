import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:objectbox/objectbox.dart';

dynamic enumFromString(String? value, dynamic t) {
  return t.values.firstWhere(
      (e) => e.toString().split('.')[1].toUpperCase() == value!.toUpperCase());
}

int estimateNumberOfLines(String text) {
  if (text.isEmpty) {
    return 0;
  }

  final numberOfLines = text.split('\n').length;
  const estimatedCharPerLine = 50; // Change this value based on your needs
  final textLengthWithoutNewlines = text.replaceAll('\n', '').length;
  final estimatedLineLength = textLengthWithoutNewlines / estimatedCharPerLine;
  final estimatedNumberOfLines = (estimatedLineLength).ceil();

  return estimatedNumberOfLines;
}

final logger = Logger();

TextStyle textStyle(
  BuildContext context,
  double size, {
  color = const Color(0xff222333),
  weight = FontWeight.w500,
}) {
  if (["fa", "ar"]
      .contains(EasyLocalization.of(context)!.currentLocale!.languageCode)) {
    return GoogleFonts.lalezar(
        fontSize: size, fontWeight: weight, color: color);
  }
  return GoogleFonts.rubik(fontSize: size, fontWeight: weight, color: color);
}

int gridTileCount(double maxWidth, [size = 135.0]) {
  final tileSize = maxWidth / size;
  final res = tileSize.round() == 0
      ? 1
      : (2.8 >= tileSize && tileSize >= 1.85)
          ? 2
          : tileSize;
  return res.round();
}

Color string2Color(String colorString) {
  int value = 0x00000000;
  if (colorString.isNotEmpty) {
    if (colorString[0] == '#') {
      colorString = colorString.substring(1);
    }
    value = int.tryParse(colorString, radix: 16)!;
    if (value < 0xFF000000) {
      value += 0xFF000000;
    }
  }
  return Color(value);
}

class ToManyActionConverter
    implements JsonConverter<ToMany<Action>, List<Action>> {
  const ToManyActionConverter();

  @override
  ToMany<Action> fromJson(List<Action> list) => ToMany(items: list);

  @override
  List<Action> toJson(ToMany<Action> object) =>
      object.map((element) => element).toList();
}

String indexToString(int index) {
  switch (index) {
    case 0:
      return "first";
    case 1:
      return "second";
    case 2:
      return "third";
    case 3:
      return "fourth";
    case 4:
      return "fifth";
    default:
      return "first";
  }
}
