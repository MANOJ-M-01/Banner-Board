import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:banner_board/animations/blink_text.dart';
import 'package:banner_board/animations/pulse_text.dart';
import 'package:banner_board/animations/wave_text.dart';
import 'package:banner_board/animations/text_marquee_painter.dart';
import 'package:banner_board/models/banner_run.dart';

class DisplayScreen extends StatefulWidget {
  final BannerRun bannerRun;

  const DisplayScreen({super.key, required this.bannerRun});

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Lock orientation based on user preference
    if (widget.bannerRun.orientation == 'landscape') {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    // Fullscreen mode
    if (widget.bannerRun.fullscreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    }

    // Keep screen awake based on user preference
    if (widget.bannerRun.alwaysOn) {
      if (widget.bannerRun.sleepAfter > 0) {
        Timer(Duration(hours: widget.bannerRun.sleepAfter), () {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
          Navigator.pop(context);
        });
      }
    }

    // Start animation controller for marquee or other animations
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: (5000 ~/ widget.bannerRun.speed)),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget animatedWidget;

    // Select the correct animation based on the user's preference
    switch (widget.bannerRun.animationType) {
      case 'blink':
        animatedWidget = BlinkText(
          text: widget.bannerRun.text,
          fontSize: widget.bannerRun.fontSize,
          color: widget.bannerRun.textColor,
        );
        break;
      case 'pulse':
        animatedWidget = PulseText(
          text: widget.bannerRun.text,
          fontSize: widget.bannerRun.fontSize,
          color: widget.bannerRun.textColor,
        );
        break;
      case 'wave':
        animatedWidget = WaveText(
          text: widget.bannerRun.text,
          fontSize: widget.bannerRun.fontSize,
          color: widget.bannerRun.textColor,
        );
        break;
      default:
        // Default to marquee animation
        animatedWidget = AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            return CustomPaint(
              painter: TextMarqueePainter(
                progress: _controller.value,
                text: widget.bannerRun.text,
                fontFamily: widget.bannerRun.fontFamily,
                fontSize: widget.bannerRun.fontSize,
                color: widget.bannerRun.textColor,
                direction: widget.bannerRun.direction,
                align: widget.bannerRun.align,
              ),
              child: Container(),
            );
          },
        );
    }

    return Scaffold(
      backgroundColor: widget.bannerRun.backgroundColor,
      body: Center(child: animatedWidget),
    );
  }
}
