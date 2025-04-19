import 'package:flutter/material.dart';
import 'package:banner_board/screens/settings_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const BannerBoard());
}

class BannerBoard extends StatelessWidget {
  const BannerBoard({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      title: 'Marquee Board',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(), // black background, white text
      home: const SettingsScreen(),
    );
  }
}
