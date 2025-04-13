# Text Banner App (Flutter)

A fullscreen text banner app with animation effects like Marquee, Blink, Wave, and Pulse. Built using pure Flutter (no external animation libraries).

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

## ✅ APK Export Steps

1. **Enable Signing (optional)** in `android/app/build.gradle`
2. Then run: `flutter build apk --release`
3. Optimized APK: `flutter build apk --target-platform android-arm64 --analyze-size`

## How to Change App Icon in Flutter

https://www.youtube.com/watch?v=C9yTHKbwKOI
https://pub.dev/packages/flutter_launcher_icons

- dart run flutter_launcher_icons:generate
- dart run flutter_launcher_icons

## Reference

- https://font.download/search?q=neon
- https://medium.com/@panuj330/pushing-flutter-to-the-limit-the-ultimate-guide-to-reducing-flutter-app-size-4eb05c4351d1
