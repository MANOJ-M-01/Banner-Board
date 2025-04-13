import 'package:flutter/material.dart';

class BlinkText extends StatefulWidget {
  final String text;
  final double fontSize;
  final Color color;
  final String fontFamily;
  final double textShadowSize;

  const BlinkText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    required this.fontFamily,
    required this.textShadowSize,
  });

  @override
  State<BlinkText> createState() => _BlinkTextState();
}

class _BlinkTextState extends State<BlinkText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _opacity = Tween<double>(begin: 1, end: 0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: widget.fontSize,
          color: widget.color,
          fontFamily: widget.fontFamily,
          shadows:
              widget.textShadowSize > 0.0
                  ? [
                    Shadow(
                      blurRadius: widget.textShadowSize,
                      color: widget.color.withAlpha((0.5 * 255).toInt()),
                      offset: const Offset(5.0, 5.0),
                    ),
                  ]
                  : [],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
