import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'helpers.dart';
import 'color.dart';

extension StringExt on String {
  Color toColor() => string2Color(this);
}

extension IntExt on int {
  double percent(int part) => this / part;
}

extension DoubleExt on double {
  double percent(double part) => this / part;
}

extension Flex on Widget {
  Flexible flex(int flex, [FlexFit? fit]) =>
      Flexible(flex: flex, fit: fit ?? FlexFit.loose, child: this);
}

extension ColorUtils on Color {
  // bool get isDark => this.computeLuminance() <= 0.179;
  bool get isDark => this.brightness <= 128.0;
  bool get isLight => !this.isDark;

  double get brightness {
    final r = this.red;
    final g = this.green;
    final b = this.blue;

    return (r * 299 + g * 587 + b * 114) / 1000;
  }

  HSVColor toHsv() {
    return HSVColor.fromColor(this);
  }

  HslColor toHsl() {
    final hsl = rgbToHsl(
      r: this.red.toDouble(),
      g: this.green.toDouble(),
      b: this.blue.toDouble(),
    );
    return HslColor(hsl.h * 360, hsl.s, hsl.l, a: this.alpha.toDouble());
  }

  Color desaturate(int amount) {
    var hsl = this.toHsl();
    hsl.s -= amount / 100;
    hsl.s = clamp01(hsl.s);
    return hslToColor(hsl);
  }

  Color saturate([int amount = 10]) {
    final hsl = this.toHsl();
    hsl.s += amount / 100;
    hsl.s = clamp01(hsl.s);
    return hslToColor(hsl);
  }

  Color lighten([int amount = 10]) {
    final hsl = this.toHsl();
    hsl.l += amount / 100;
    hsl.l = clamp01(hsl.l);
    return hslToColor(hsl);
  }

  Color brighten([int amount = 10]) {
    final color = Color.fromARGB(
      this.alpha,
      math.max(0, math.min(255, this.red - (255 * -(amount / 100)).round())),
      math.max(0, math.min(255, this.green - (255 * -(amount / 100)).round())),
      math.max(0, math.min(255, this.blue - (255 * -(amount / 100)).round())),
    );
    return color;
  }

  Color darken([int amount = 10]) {
    final hsl = this.toHsl();
    hsl.l -= amount / 100;
    hsl.l = clamp01(hsl.l);
    return hslToColor(hsl);
  }

  Color tint([int amount = 10]) {
    return this.mix(input: Color.fromRGBO(255, 255, 255, 1.0));
  }

  Color shade([int amount = 10]) {
    return this.mix(input: Color.fromRGBO(0, 0, 0, 1.0));
  }

  Color greyscale() {
    return desaturate(100);
  }

  Color spin(double amount) {
    final hsl = this.toHsl();
    final hue = (hsl.h + amount) % 360;
    hsl.h = hue < 0 ? 360 + hue : hue;
    return hslToColor(hsl);
  }

  Color mix({required Color input, int amount = 50}) {
    final int p = (amount / 100).round();
    final color = Color.fromARGB(
        (input.alpha - this.alpha) * p + this.alpha,
        (input.red - this.red) * p + this.red,
        (input.green - this.green) * p + this.green,
        (input.blue - this.blue) * p + this.blue);
    return color;
  }
}