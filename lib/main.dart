import 'package:flutter/material.dart';
import 'package:banner_board/screens/settings_screen.dart';

void main() {
  runApp(const BannerBoard());
}

class BannerBoard extends StatelessWidget {
  const BannerBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marquee Board',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(), // black background, white text
      home: const SettingsScreen(),
    );
  }
}
