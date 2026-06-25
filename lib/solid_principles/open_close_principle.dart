/// O – Open/Closed Principle (OCP)
///
/// You should be able to add new features or behaviors to your code without changing
/// the existing code that you already wrote and tested
/// You achieve this using interfaces or abstract classes
///
/// Software entities (classes, modules, functions, etc.) should be open for extension, but closed for modification.

/// The Analogy: The Wall Outlet and Electrical Plugs
/// Think of a wall outlet in your house.
///
/// •	Closed for Modification: You don’t tear open the wall and
/// rewire your house's electrical grid every time you buy a new appliance.
/// The outlet's design is locked and finished.
///
/// •	Open for Extension: The outlet provides a standard interface (the plug slots).
/// Because of this interface, you can plug in a lamp, a vacuum, a phone charger, or a toaster.
/// The outlet's utility is constantly "extended" to support new devices without ever altering the outlet itself.

/// Why This Helps You
/// 	1.	Zero Regression Bugs: Because you aren't changing old code to add new features,
///       you can't accidentally break old features.
/// 	2.	Pluggable Architecture: Features can be built independently.
///       In a team setting, one developer can work on adding ApplePayPayment without ever
///       causing a merge conflict with someone editing the PaymentProcessor.

///
/// Bad example
///
class CreditCard {
  void processCc() => print("Processing credit card...");
}

class PayPal {
  void processPaypal() => print("Processing PayPal...");
}

// ❌ Violation: Every time we add a new payment method, we must MODIFIY this class.
class PaymentProcessorViolator {
  void processPayment(Object paymentType) {
    if (paymentType is CreditCard) {
      paymentType.processCc();
    } else if (paymentType is PayPal) {
      paymentType.processPaypal();
    }
    // What happens when we need to add Apple Pay?
    // We have to open this class up and add another 'else if'.
  }
}

///
/// Good example
///
// 1. Define a standard interface (The "Wall Outlet")
abstract class PaymentMethod {
  void pay();
}

// 2. Implement the specific behaviors (The "Plugs")
class CreditCardPayment implements PaymentMethod {
  @override
  void pay() => print("Processing credit card...");
}

class PayPalPayment implements PaymentMethod {
  @override
  void pay() => print("Processing PayPal...");
}

// 3. The Processor is completely closed to modification
class PaymentProcessor {
  // This method doesn't care WHAT payment method it is, as long as it has a pay() method.
  void processPayment(PaymentMethod method) {
    method.pay();
  }
}

// Successfully EXTENDING functionality without MODIFYING existing code
class ApplePayPayment implements PaymentMethod {
  @override
  void pay() => print("Processing Apple Pay...");
}

// Usage
void main() {
  final processor = PaymentProcessor();

  // Works seamlessly with old or new payment types
  processor.processPayment(CreditCardPayment());
  processor.processPayment(ApplePayPayment());
}
