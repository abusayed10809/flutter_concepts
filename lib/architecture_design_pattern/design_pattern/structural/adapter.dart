// The Adapter Pattern
// The Adapter Pattern allows two incompatible interfaces to work together. It acts like a physical travel plug adapter: it wraps an existing class (often from a third-party package) and translates its methods into a format that your app's existing architecture expects.
// Flutter Example: Integrating a New Analytics Provider
// Imagine your app has an interface for logging events. You used to use Firebase, but now management wants to switch to (or test) a new platform called CustomAnalytics, which uses completely different method names.

// 1. The Target Interface your app already uses everywhere
abstract class AppAnalytics {
  void logUserClick(String buttonName);
}

// 2. The Adaptee: A 3rd-party library with an incompatible interface
class CustomAnalyticsSDK {
  // It uses trackEvent instead of logUserClick, and requires a Map
  void trackEvent(String eventName, Map<String, dynamic> properties) {
    print("SDK Tracked: $eventName with $properties");
  }
}

// 3. THE ADAPTER
// It implements your app's interface, but translates under the hood
class CustomAnalyticsAdapter implements AppAnalytics {
  final CustomAnalyticsSDK _sdk;

  CustomAnalyticsAdapter(this._sdk);

  @override
  void logUserClick(String buttonName) {
    // Translating the call to match what the SDK expects
    _sdk.trackEvent("ui_click", {"element": buttonName});
  }
}

// --- HOW YOU USE IT ---
// void main() {
//   // Your app code only cares about the 'AppAnalytics' contract
//   final AppAnalytics analytics = CustomAnalyticsAdapter(CustomAnalyticsSDK());
//
//   analytics.logUserClick("checkout_button");
// }
