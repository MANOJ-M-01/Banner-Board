import 'package:flutter/material.dart';

class BannerRun {
  String text;
  String fontFamily;
  TextAlign align;
  double textShadowSize;
  double fontSize;
  Color textColor;
  Color backgroundColor;
  bool fullscreen;
  bool alwaysOn;
  int sleepAfter; // in hours
  String direction;
  String animationType;
  double speed;
  String orientation;

  BannerRun({
    required this.text,
    required this.fontFamily,
    required this.align,
    required this.textShadowSize,
    required this.fontSize,
    required this.textColor,
    required this.backgroundColor,
    required this.fullscreen,
    required this.alwaysOn,
    required this.sleepAfter,
    required this.direction,
    required this.animationType,
    required this.speed,
    required this.orientation,
  });
}
