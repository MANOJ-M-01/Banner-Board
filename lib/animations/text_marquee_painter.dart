import 'package:flutter/material.dart';

class TextMarqueePainter extends CustomPainter {
  final double progress;
  final String text;
  final String fontFamily;
  final double fontSize;
  final Color color;
  final double textShadowSize;
  final String direction;
  final TextAlign align;

  TextMarqueePainter({
    required this.progress,
    required this.text,
    required this.fontFamily,
    required this.fontSize,
    required this.color,
    required this.textShadowSize,
    required this.direction,
    this.align = TextAlign.left,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: color,
      shadows:
          textShadowSize > 0.0
              ? [
                Shadow(
                  blurRadius: textShadowSize,
                  color: color.withAlpha((0.5 * 255).toInt()),
                  offset: const Offset(5.0, 5.0),
                ),
              ]
              : [],
    );

    final textSpan = TextSpan(text: text, style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: align,
      maxLines: null,
    );

    // Layout text with constrained width (wrap lines)r
    if (direction == "top" || direction == "bottom") {
      textPainter.layout(maxWidth: size.width);
    } else {
      textPainter.layout();
    }

    // Calculate offset
    final textWidth = textPainter.width;
    final textHeight = textPainter.height;
    double dx = 0, dy = 0;

    switch (direction) {
      case 'left':
        dx = size.width - (size.width + textWidth) * progress;
        dy = (size.height - textHeight) / 2; // Vertically center
        break;
      case 'right':
        dx = -textWidth + (size.width + textWidth) * progress;
        dy = (size.height - textHeight) / 2;
        break;
      case 'top':
        dx = (size.width - textWidth) / 2; // Horizontally center
        dy = size.height - (size.height + textHeight) * progress;
        break;
      case 'bottom':
        dx = (size.width - textWidth) / 2;
        dy = -textHeight + (size.height + textHeight) * progress;
        break;
    }

    // Clip the canvas to size's bounds (width + height)
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));
    textPainter.paint(canvas, Offset(dx, dy));
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
