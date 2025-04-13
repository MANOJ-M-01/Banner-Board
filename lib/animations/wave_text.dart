import 'dart:math';
import 'package:flutter/material.dart';

class WaveText extends StatefulWidget {
  final String text;
  final double fontSize;
  final Color color;

  const WaveText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
  });

  @override
  State<WaveText> createState() => _WaveTextState();
}

class _WaveTextState extends State<WaveText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.text.length, (i) {
            final char = widget.text[i];
            final offset = sin((_controller.value * 2 * pi) + (i * 0.5));
            return Transform.translate(
              offset: Offset(0, offset * 10),
              child: Text(
                char,
                style: TextStyle(
                  fontSize: widget.fontSize,
                  color: widget.color,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
