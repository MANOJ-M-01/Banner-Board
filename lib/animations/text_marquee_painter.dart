import 'package:flutter/material.dart';

class TextMarqueePainter extends CustomPainter {
  final double progress;
  final String text;
  final String fontFamily;
  final double fontSize;
  final Color color;
  final String direction;

  TextMarqueePainter({
    required this.progress,
    required this.text,
    required this.fontFamily,
    required this.fontSize,
    required this.color,
    required this.direction,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          color: color,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    double dx = 0, dy = 0;
    final textWidth = textPainter.width;
    final textHeight = textPainter.height;

    switch (direction) {
      case 'left':
        dx = size.width - (size.width + textWidth) * progress;
        dy = (size.height - textHeight) / 2;
        break;
      case 'right':
        dx = -textWidth + (size.width + textWidth) * progress;
        dy = (size.height - textHeight) / 2;
        break;
      case 'top':
        dx = (size.width - textWidth) / 2;
        dy = size.height - (size.height + textHeight) * progress;
        break;
      case 'bottom':
        dx = (size.width - textWidth) / 2;
        dy = -textHeight + (size.height + textHeight) * progress;
        break;
    }

    textPainter.paint(canvas, Offset(dx, dy));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
