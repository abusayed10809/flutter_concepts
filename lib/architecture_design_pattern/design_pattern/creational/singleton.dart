// Singleton
// Ensures a class has only one instance and provides a global point of access to it.
// In Flutter, this is perfect for services like theme management, local storage, or shared preferences where you don't want multiple instances fighting over the same data.

class ThemeManager {
  // 1. Private constructor to prevent external instantiation
  ThemeManager._internal();

  // 2. The single, static instance of the class
  static final ThemeManager _instance = ThemeManager._internal();

  // 3. Factory constructor that always returns the same instance
  factory ThemeManager() {
    return _instance;
  }

  // App state
  bool isDarkMode = false;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    print("Theme changed to: ${isDarkMode ? 'Dark' : 'Light'}");
  }
}

// --- Flutter Usage Example ---
void main() {
  var manager1 = ThemeManager();
  var manager2 = ThemeManager();

  // Both variables point to the exact same instance
  print(identical(manager1, manager2)); // Output: true

  manager1.toggleTheme(); // Output: Theme changed to: Dark
  print(manager2.isDarkMode); // Output: true
}
