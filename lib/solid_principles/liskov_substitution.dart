/// L – Liskov Substitution Principle (LSP)
/// "Subclasses should be substitutable for their base classes."
///
/// If Class B is a child of Class A,
/// you should be able to pass Class B into any function that expects Class A
/// without breaking the application.
/// The child class must honor the "contract" of the parent class.
///
/// •	Bad Example: You have a parent class Bird with a fly() method.
///   You create a subclass Ostrich.
///   But ostriches can't fly, so you make Ostrich.fly() throw an error.
///   Now, any code expecting a Bird will crash if it gets an Ostrich.
///
/// •	Good Example: Separate the behaviors.
///   Create a Bird class,
///   a FlyingBird subclass,
///   and a NonFlyingBird subclass.

/// The Analogy: The Electric Toy Duck
/// Think of a real Duck and a Toy Electric Duck.
/// •	If you create a subclass called ElectronicDuck that inherits from Duck,
///   you might override the quack() method to play a digital sound file.
///
/// •	But what happens when the ElectronicDuck runs out of batteries? It can no longer quack.
/// •	If a child takes both ducks to a pond and expects them both to swim and quack,
///   the electronic duck fails the expectation because it needs batteries to function.
///   It breaks the "contract" of what a duck is supposed to do inherently.
///   The toy duck cannot seamlessly substitute a real duck without breaking the system.

/// Why This Helps You
/// 	1.	Predictability: You can use inheritance without fearing
///       that a specific subclass will secretly throw an unexpected UnimplementedError.
/// 	2.	True Polymorphism: Your client code can confidently treat
///       groups of subclasses uniformly based on their parent interface.

///
/// Bad example
///
abstract class CustomButton {
  void render();

  void onClick();
}

class PrimaryButtonViolator extends CustomButton {
  @override
  void render() => print("Rendering a shiny blue button.");

  @override
  void onClick() => print("Navigating to next screen...");
}

// ❌ Violation: A DisabledButton is a Button, but it CANNOT fulfill the onClick behavior.
class DisabledButtonViolator extends CustomButton {
  @override
  void render() => print("Rendering a greyed-out button.");

  @override
  void onClick() {
    // This breaks the behavior contract of the base class!
    throw Exception("Error: A disabled button cannot be clicked!");
  }
}

///
/// Good example
///
// 1. Separate the basic rendering from the interaction behavior
abstract class RenderableWidget {
  void render();
}

abstract class ClickableWidget extends RenderableWidget {
  void onClick();
}

// 2. Implement only what makes sense
class PrimaryButton implements ClickableWidget {
  @override
  void render() => print("Rendering a shiny blue button.");

  @override
  void onClick() => print("Navigating to next screen...");
}

class DisabledButton implements RenderableWidget {
  @override
  void render() => print("Rendering a greyed-out button.");
  // It no longer claims it can be clicked, so it doesn't break any promises!
}
