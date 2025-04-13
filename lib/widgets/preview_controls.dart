import 'package:flutter/material.dart';

class PreviewControls extends StatelessWidget {
  final bool fullscreen;
  final bool alwaysOn;
  final int sleepAfter;
  final String screenOrientation;
  final Function(bool?) onFullscreenChanged;
  final Function(bool?) onAlwaysOnChanged;
  final Function(int?) onSleepAfterChanged;
  final Function(String?) onOrientationChanged;

  const PreviewControls({
    super.key,
    required this.fullscreen,
    required this.alwaysOn,
    required this.sleepAfter,
    required this.screenOrientation,
    required this.onFullscreenChanged,
    required this.onAlwaysOnChanged,
    required this.onSleepAfterChanged,
    required this.onOrientationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          value: fullscreen,
          onChanged: onFullscreenChanged,
          title: const Text('Fullscreen'),
        ),
        CheckboxListTile(
          value: alwaysOn,
          onChanged: onAlwaysOnChanged,
          title: const Text('Always On Display'),
        ),
        const SizedBox(height: 10),
        const Text('Sleep After (hours):'),
        DropdownButton<int>(
          value: sleepAfter,
          onChanged: onSleepAfterChanged,
          items: const [
            DropdownMenuItem(value: 0, child: Text('Never')),
            DropdownMenuItem(value: 1, child: Text('1 Hour')),
            DropdownMenuItem(value: 2, child: Text('2 Hours')),
            DropdownMenuItem(value: 3, child: Text('3 Hours')),
          ],
        ),
        const SizedBox(height: 10),
        const Text('Screen Orientation:'),
        DropdownButton<String>(
          value: screenOrientation,
          onChanged: onOrientationChanged,
          items: const [
            DropdownMenuItem(value: 'landscape', child: Text('Landscape')),
            DropdownMenuItem(value: 'portrait', child: Text('Portrait')),
          ],
        ),
      ],
    );
  }
}
