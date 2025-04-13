import 'package:flutter/material.dart';

class AnimationControls extends StatelessWidget {
  final String direction;
  final String animationType;
  final double speed;
  final Function(String) onDirectionChanged;
  final Function(String) onAnimationTypeChanged;
  final Function(double) onSpeedChanged;

  const AnimationControls({
    super.key,
    required this.direction,
    required this.animationType,
    required this.speed,
    required this.onDirectionChanged,
    required this.onAnimationTypeChanged,
    required this.onSpeedChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Animation Direction:'),
        DropdownButton<String>(
          value: direction,
          onChanged: (val) => onDirectionChanged(val!),
          items: const [
            DropdownMenuItem(value: 'left', child: Text('Left')),
            DropdownMenuItem(value: 'right', child: Text('Right')),
            DropdownMenuItem(value: 'top', child: Text('Top')),
            DropdownMenuItem(value: 'bottom', child: Text('Bottom')),
          ],
        ),
        const SizedBox(height: 10),
        const Text('Animation Type:'),
        DropdownButton<String>(
          value: animationType,
          onChanged: (val) => onAnimationTypeChanged(val!),
          items: const [
            DropdownMenuItem(value: 'marquee', child: Text('Marquee')),
            DropdownMenuItem(value: 'blink', child: Text('Blink')),
            DropdownMenuItem(value: 'wave', child: Text('Wave')),
            DropdownMenuItem(value: 'pulse', child: Text('Pulse')),
          ],
        ),
        const SizedBox(height: 10),
        const Text('Animation Speed:'),
        Slider(
          value: speed,
          min: 0.1,
          max: 5.0,
          divisions: 49,
          onChanged: onSpeedChanged,
        ),
      ],
    );
  }
}
