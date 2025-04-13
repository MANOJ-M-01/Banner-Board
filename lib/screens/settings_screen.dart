import 'package:flutter/material.dart';
import 'package:banner_board/screens/display_screen.dart';
import 'package:banner_board/widgets/color_picker.dart';
import 'package:banner_board/widgets/font_controls.dart';
import 'package:banner_board/widgets/animation_controls.dart';
import 'package:banner_board/widgets/preview_controls.dart';
import 'package:banner_board/models/banner_run.dart';
import 'package:banner_board/utils/type_cast.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String inputText = 'Welcome to Banner Board!';
  double fontSize = 200;
  String fontAlign = "center";
  Color textColor = Colors.yellow;
  Color backgroundColor = Colors.black;

  bool fullscreen = true;
  bool alwaysOn = true;
  int sleepAfter = 0;

  String direction = 'left';
  String animationType = 'marquee';
  double speed = 0.5;

  String screenOrientation = 'landscape';
  String selectedFont = 'Tarragon';
  String selectedFontWeight = 'Normal';
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.text = inputText;
  }

  void runDisplay() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => DisplayScreen(
              bannerRun: BannerRun(
                text: textController.text,
                fontFamily: selectedFont,
                align: textAlignFromString(fontAlign),
                fontSize: fontSize,
                textColor: textColor,
                backgroundColor: backgroundColor,
                fullscreen: fullscreen,
                alwaysOn: alwaysOn,
                sleepAfter: sleepAfter,
                direction: direction,
                animationType: animationType,
                speed: speed,
                orientation: screenOrientation,
              ),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banner Board Settings'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('Text to display:'),
            const SizedBox(height: 5),
            TextField(
              controller: textController,
              maxLength: 100,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            FontControls(
              fontSize: fontSize,
              selectedFont: selectedFont,
              selectedFontWeight: selectedFontWeight,
              fontAlign: fontAlign,
              onFontChanged: (value) => setState(() => selectedFont = value),
              onFontSizeChanged: (value) => setState(() => fontSize = value),
              onFontWeightChanged:
                  (value) => setState(() => selectedFontWeight = value),
              onFontAlignChanged: (val) => setState(() => fontAlign = val),
            ),
            const SizedBox(height: 20),
            ColorPicker(
              selectedColor: textColor,
              onColorSelected: (color) => setState(() => textColor = color),
              isBackground: false,
            ),
            const SizedBox(height: 10),
            ColorPicker(
              selectedColor: backgroundColor,
              onColorSelected:
                  (color) => setState(() => backgroundColor = color),
              isBackground: true,
            ),
            const SizedBox(height: 30),
            PreviewControls(
              fullscreen: fullscreen,
              alwaysOn: alwaysOn,
              sleepAfter: sleepAfter,
              screenOrientation: screenOrientation,
              onFullscreenChanged:
                  (val) => setState(() => fullscreen = val ?? false),
              onAlwaysOnChanged:
                  (val) => setState(() => alwaysOn = val ?? false),
              onSleepAfterChanged:
                  (val) => setState(() => sleepAfter = val ?? 0),
              onOrientationChanged:
                  (val) => setState(() => screenOrientation = val ?? ''),
            ),
            const SizedBox(height: 20),
            AnimationControls(
              direction: direction,
              animationType: animationType,
              speed: speed,
              onDirectionChanged: (val) => setState(() => direction = val),
              onAnimationTypeChanged:
                  (val) => setState(() => animationType = val),
              onSpeedChanged: (val) => setState(() => speed = val),
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: runDisplay, child: const Text('Run')),
          ],
        ),
      ),
    );
  }
}
