# Text Banner App (Flutter)

A fullscreen text banner app with animation effects like Marquee, Blink, Wave, and Pulse. Built using pure Flutter (no external animation libraries).

## How it looks
<img height="300" src="./out/Screen 1.jpg" /> <img height="300" src="./out/Screen 2.jpg" /> <img height="300" src="./out/Screen 3.jpg" />

## Download APK

[Banner Board APK Release Links](https://github.com/MANOJ-M-01/Banner-Board/releases/tag/1.2.4)

## 🎯 Features

- Fullscreen text display
- Animations: Marquee, Blink, Pulse, Wave
- Customization options:
  - Text, Font Size, Text Color
  - Background Color
  - Orientation (Portrait/Landscape)
  - Animation Speed, Direction
  - Always-on Display + Auto Sleep

## 🧪 Preview & Run

```bash
flutter pub get
flutter run
```

## Native Splash Screen

`dart run flutter_native_splash:create --path=flutter_native_splash.yaml`

## ✅ APK Export Steps

1. **Enable Signing (optional)** in `android/app/build.gradle`
2. Then run: `flutter build apk --release`
3. Optimized APK: `flutter build apk --target-platform android-arm64 --analyze-size`

## Reference

- https://fonts.google.com/
