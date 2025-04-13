import 'package:flutter/material.dart';

TextAlign textAlignFromString(String align) {
  switch (align.toLowerCase()) {
    case 'left':
      return TextAlign.left;
    case 'right':
      return TextAlign.right;
    case 'center':
      return TextAlign.center;
    case 'justify':
      return TextAlign.justify;
    default:
      return TextAlign.left;
  }
}
