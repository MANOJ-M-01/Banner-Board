import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  final Color selectedColor;
  final Function(Color) onColorSelected;
  final bool isBackground;

  const ColorPicker({
    super.key,
    required this.selectedColor,
    required this.onColorSelected,
    this.isBackground = false,
  });

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      // Basic Colors
      Colors.black,
      Colors.white,
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.yellow,
      Colors.grey,

      // Neon & Vibrant Banner Colors
      const Color(0xFFFF00FF), // Neon Pink
      const Color(0xFF39FF14), // Neon Green
      const Color(0xFF00FFFF), // Neon Cyan
      const Color(0xFFFFA500), // Bright Orange
      const Color(0xFF00BFFF), // Deep Sky Blue
      const Color(0xFFFFFF00), // Bright Yellow
      const Color(0xFFFF1493), // Deep Pink
      const Color(0xFF7CFC00), // Lawn Green
      const Color(0xFFDA70D6), // Orchid
      const Color(0xFF40E0D0), // Turquoise
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isBackground ? 'Select Background Color' : 'Select Text Color',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                colors.map((color) {
                  return GestureDetector(
                    onTap: () => onColorSelected(color),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:
                              selectedColor == color
                                  ? Colors.white
                                  : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}
