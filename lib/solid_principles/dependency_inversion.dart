/// Dependency Inversion Principle
/// 1. High-level modules should not depend on low-level modules. Both should depend on abstractions.
/// 2. Abstractions should not depend on details. Details should depend on abstractions.

/// Your core business logic (high-level code)
/// shouldn't care about the concrete details of how data is fetched or saved (low-level code).
/// Instead, both should rely on a shared contract (an interface or abstract class).

/// This "inverts" the traditional dependency flow.
/// Instead of the high-level class looking down at the low-level class,
/// both look up toward an abstract interface.

/// The Analogy: Your Computer and its USB Ports
/// Think about how you connect devices to your laptop.
/// •	The Violation (No DIP): Imagine if a laptop manufacturer soldered a specific mouse cord directly onto the motherboard.
///    If that mouse broke, you'd have to throw away the laptop or un-solder the board.
///    If you wanted to plug in a keyboard instead, you couldn't do it without rebuilding the computer.
/// •	The DIP Solution: The laptop provides a USB Port (the Abstraction/Interface).
///   The laptop doesn't care what you plug into it.
///   The mouse maker and the flash drive maker build their devices to fit the USB standard (the Details depend on the Abstraction).
///   Now, you can plug in any device smoothly without changing your laptop's internal hardware.

/// Why This Helps You
/// 	1.	Painless Tech-Stack Changes: You can swap out network clients (e.g., swapping Http for Dio),
///       database engines, or analytics trackers effortlessly.
/// 	2.	Seamless Mock Testing: You can write mock classes that implement your interfaces,
///       allowing you to run fast, offline unit tests for your business logic without ever writing data
///       to a real disk or making network calls.

///
/// Bad example
///

/// Why this is bad: If you decide to switch your app's database from Hive to SharedPreferences or Isar,
/// you have to change the code inside SettingsViewModel.
/// The high-level module is at the mercy of changes made to low-level storage engines.

// Low-level module (The specific database tool)
class HiveStorage {
  void write(String key, String value) => print("Saving $value to Hive DB...");
}

// High-level module (The business logic)
class SettingsViewModelViolator {
  // ❌ Violation: Directly coupled to a specific database implementation
  final HiveStorage _storage = HiveStorage();

  void changeTheme(String newTheme) {
    // Business logic details...
    _storage.write("theme", newTheme);
  }
}

///
/// Good example
///
// 1. Create the Abstraction (The USB Port)
abstract class LocalStorage {
  void saveString(String key, String value);
}

// 2. High-level module depends ONLY on the Abstraction
class SettingsViewModel {
  final LocalStorage _storage;

  // The storage implementation is "injected" from the outside
  SettingsViewModel({required LocalStorage storage}) : _storage = storage;

  void changeTheme(String newTheme) {
    _storage.saveString("theme", newTheme); // Safe and decoupled!
  }
}

// Concrete implementation 1 (Detail)
class HiveStorageService implements LocalStorage {
  @override
  void saveString(String key, String value) =>
      print("Saving $value to Hive...");
}

// Concrete implementation 2 (Detail)
class SharedPrefsStorageService implements LocalStorage {
  @override
  void saveString(String key, String value) =>
      print("Saving $value to SharedPreferences...");
}

void main() {
  // We can inject Hive...
  final viewModelWithHive = SettingsViewModel(storage: HiveStorageService());
  viewModelWithHive.changeTheme("dark_mode");

  // ...or easily swap it out for SharedPreferences with zero code changes to the VM
  final viewModelWithPrefs = SettingsViewModel(
    storage: SharedPrefsStorageService(),
  );
  viewModelWithPrefs.changeTheme("light_mode");
}
