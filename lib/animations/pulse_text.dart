import 'package:flutter/material.dart';

class PulseText extends StatefulWidget {
  final String text;
  final double fontSize;
  final Color color;

  const PulseText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
  });

  @override
  State<PulseText> createState() => _PulseTextState();
}

class _PulseTextState extends State<PulseText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    _scale = Tween<double>(begin: 1.0, end: 1.5).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      child: Text(
        widget.text,
        style: TextStyle(fontSize: widget.fontSize, color: widget.color),
        textAlign: TextAlign.center,
      ),
    );
  }
}
