// The Strategy Pattern
// The Strategy Pattern defines a family of algorithms, encapsulates each one, and makes them interchangeable at runtime.
// It lets the algorithm vary independently from the clients that use it.
// The Analogy: Navigating with Google Maps
// When you open Google Maps to get directions, you can choose your strategy: Driving, Walking, Cycling, or Public Transit.
// The destination stays exactly the same, but the underlying mathematical algorithm used to compute your route switches seamlessly depending on the button you tap.

// 1. The Strategy Contract
abstract class PaymentStrategy {
  void collectPayment(double amount);
}

// 2. Concrete Strategy A
class CreditCardPayment implements PaymentStrategy {
  @override
  void collectPayment(double amount) =>
      print("💳 Processing \$$amount via Credit Card.");
}

// 3. Concrete Strategy B
class PayPalPayment implements PaymentStrategy {
  @override
  void collectPayment(double amount) =>
      print("🐸 Processing \$$amount via PayPal.");
}

// 4. The Context (The Checkout System)
class CheckoutCart {
  PaymentStrategy? _paymentStrategy;

  // Swap the strategy dynamically at runtime
  void setPaymentStrategy(PaymentStrategy strategy) {
    _paymentStrategy = strategy;
  }

  void checkout(double total) {
    if (_paymentStrategy == null)
      throw Exception("Please select a payment method.");
    _paymentStrategy!.collectPayment(total);
  }
}

void main() {
  final cart = CheckoutCart();

  // User selects Credit Card at checkout
  cart.setPaymentStrategy(CreditCardPayment());
  cart.checkout(45.99);

  // User changes mind and selects PayPal
  cart.setPaymentStrategy(PayPalPayment());
  cart.checkout(45.99);
}
