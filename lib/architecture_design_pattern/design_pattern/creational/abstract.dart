// Abstract Factory
// Creates families of related or dependent objects without specifying their concrete classes.
// While the Factory Method deals with creating a single object (like a button), the Abstract Factory deals with entire suites of objects (like a button and a switch and a slider matching a specific OS design).

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Abstract Factory interface
abstract class TargetUiKitFactory {
  Widget buildButton(VoidCallback onPressed, String text);

  Widget buildSwitch(bool value, ValueChanged<bool> onChanged);
}

// Concrete Factory 1: Material Design (Android)
class MaterialFactory implements TargetUiKitFactory {
  @override
  Widget buildButton(VoidCallback onPressed, String text) =>
      ElevatedButton(onPressed: onPressed, child: Text(text));

  @override
  Widget buildSwitch(bool value, ValueChanged<bool> onChanged) =>
      Switch(value: value, onChanged: onChanged);
}

// Concrete Factory 2: Cupertino (iOS)
class CupertinoFactory implements TargetUiKitFactory {
  @override
  Widget buildButton(VoidCallback onPressed, String text) =>
      CupertinoButton.filled(onPressed: onPressed, child: Text(text));

  @override
  Widget buildSwitch(bool value, ValueChanged<bool> onChanged) =>
      CupertinoSwitch(value: value, onChanged: onChanged);
}

// --- Flutter UI Usage ---
class SettingsScreen extends StatelessWidget {
  final TargetUiKitFactory uiFactory;

  // Pass the factory down depending on app settings or OS
  const SettingsScreen({required this.uiFactory});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        uiFactory.buildButton(() {}, "Save Settings"),
        uiFactory.buildSwitch(true, (val) {}),
      ],
    );
  }
}
