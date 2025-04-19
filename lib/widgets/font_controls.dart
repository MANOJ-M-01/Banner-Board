import 'package:flutter/material.dart';

class FontControls extends StatelessWidget {
  final String selectedFont;
  final String selectedFontWeight;
  final double fontSize;
  final String fontAlign;

  final Function(String) onFontChanged;
  final Function(String) onFontWeightChanged;
  final Function(double) onFontSizeChanged;
  final Function(String) onFontAlignChanged;
  final Function(double) onTextShadowSizeChanged;
  final double textShadowSize;
  const FontControls({
    super.key,
    required this.selectedFont,
    required this.selectedFontWeight,
    required this.fontSize,
    required this.fontAlign,
    required this.onFontChanged,
    required this.onFontWeightChanged,
    required this.onFontSizeChanged,
    required this.onFontAlignChanged,
    required this.onTextShadowSizeChanged,
    required this.textShadowSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Font',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        DropdownButton<String>(
          value: selectedFont,
          onChanged: (val) => onFontChanged(val!),
          items:
              [
                    'AlfaSlabOne',
                    'Anton',
                    'BebasNeue',
                    'BigShouldersInline',
                    'Boldonse',
                    'BungeeSpice',
                    'Exo2Black',
                    'Exo2Bold',
                    'LilitaOne',
                    'Neonderthaw',
                    'PermanentMarker',
                    'PixelifySans',
                    'PoetsenOne',
                    'PressStart2P',
                    'RowdiesBold',
                    'RowdiesLight',
                    'RowdiesRegular',
                    'RubikMonoOne',
                    'SilkscreenBold',
                    'SilkscreenRegular',
                    'SpecialGothicExpandedOne',
                    'Teko',
                    'TiltNeon',
                    'TitanOne',
                  ]
                  .map(
                    (font) => DropdownMenuItem(
                      value: font,
                      child: Text(
                        font,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: font,
                        ),
                      ),
                    ),
                  )
                  .toList(),
        ),

        const SizedBox(height: 12),

        const Text(
          'Font Size',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Slider(
          value: fontSize,
          min: 30,
          max: 300,
          divisions: 18,
          label: fontSize.round().toString(),
          onChanged: onFontSizeChanged,
        ),
        Text('Selected Size: ${fontSize.toStringAsFixed(0)}'),

        const SizedBox(height: 12),

        const Text(
          'Select Font Weight',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        DropdownButton<String>(
          value: selectedFontWeight,
          onChanged: (val) => onFontWeightChanged(val!),
          items:
              ['Normal', 'Bold', 'Light', 'Heavy']
                  .map(
                    (weight) =>
                        DropdownMenuItem(value: weight, child: Text(weight)),
                  )
                  .toList(),
        ),

        const SizedBox(height: 12),

        const Text(
          'Text Alignment',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        DropdownButton<String>(
          value: fontAlign,
          onChanged: (val) => onFontAlignChanged(val!),
          items: const [
            DropdownMenuItem(value: 'left', child: Text('Left')),
            DropdownMenuItem(value: 'right', child: Text('Right')),
            DropdownMenuItem(value: 'center', child: Text('Center')),
            DropdownMenuItem(value: 'justify', child: Text('justify')),
          ],
        ),

        const SizedBox(height: 12),

        const Text(
          'Shadow Size',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Slider(
          value: textShadowSize,
          min: 0.0,
          max: 50.0,
          divisions: 50,
          label: fontSize.round().toString(),
          onChanged: onTextShadowSizeChanged,
        ),
        Text('Selected Size: ${fontSize.toStringAsFixed(0)}'),
      ],
    );
  }
}
