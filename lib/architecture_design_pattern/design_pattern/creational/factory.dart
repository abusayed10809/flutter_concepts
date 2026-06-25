// Factory Method
// Provides an interface for creating objects but lets subclasses decide which class to instantiate.
// This is incredibly useful in Flutter when you want to render different UI widgets dynamically based on the underlying platform (iOS vs. Android).

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// The Abstract Product
abstract class PlatformButton {
  Widget build(BuildContext context, VoidCallback onPressed, Widget child);
}

// Concrete Product 1: Android Button
class AndroidButton implements PlatformButton {
  @override
  Widget build(BuildContext context, VoidCallback onPressed, Widget child) {
    return ElevatedButton(onPressed: onPressed, child: child);
  }
}

// Concrete Product 2: iOS Button
class IosButton implements PlatformButton {
  @override
  Widget build(BuildContext context, VoidCallback onPressed, Widget child) {
    return CupertinoButton.filled(onPressed: onPressed, child: child);
  }
}

// The Factory Class
class PlatformButtonFactory {
  static PlatformButton createButton(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.iOS:
        return IosButton();
      case TargetPlatform.android:
      default:
        return AndroidButton();
    }
  }
}

// --- Flutter UI Usage ---
class MyButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Detect current platform
    final platform = Theme.of(context).platform;
    // Create the appropriate button via the factory
    final platformButton = PlatformButtonFactory.createButton(platform);

    return platformButton.build(
      context,
      () => print('Button Clicked!'),
      const Text('Click Me'),
    );
  }
}
