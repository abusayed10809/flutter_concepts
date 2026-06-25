/// Interface segregation principle
/// Clients should not be forced to depend upon interfaces that they do not use.

/// it is better to have many small, specific interfaces than one massive, do-it-all interface.
/// ISP keeps your codebase lean and decoupled.

/// The Analogy: The Restaurant Menu vs. A Fixed Buffet
/// Imagine going to a restaurant where you just want a cup of coffee.
/// •	The Violation (Fat Interface): The restaurant only offers a single "$50 All-You-Can-Eat Buffet" contract.
///   To get your coffee, you are forced to pay for, carry, and deal with plates of steak, sushi, and dessert that you don’t want.
/// •	The ISP Solution (Segregated Interfaces): The restaurant has an à la carte menu.
///   The drinks are on a BeverageMenu, the desserts are on a DessertMenu, and the mains are on a MainCourseMenu.
///   You only order from the BeverageMenu. You aren't forced to deal with the rest of the food.

/// Why This Helps You
/// 	1.	No Dead Code: You completely eliminate dummy methods that exist purely to satisfy a compiler.
/// 	2.	Flexibility: Your classes become like LEGO blocks.
///       You can compose complex systems by stitching together multiple small interfaces.
/// 	3.	Fewer Recompilations: If you change the Dimmable interface,
///       only the components related to lighting need to recompile.
///       Your climate systems remain entirely untouched.

///
/// Bad example
///
// ❌ Violation: A "Fat" interface forcing unrelated behaviors together
abstract class SmartHomeDevice {
  void turnOn();

  void turnOff();

  void setTemperature(double temp);

  void adjustBrightness(int brightness);
}

// This works fine for a smart climate controller
class SmartThermostatViolator implements SmartHomeDevice {
  @override
  void turnOn() => print("Thermostat on");

  @override
  void turnOff() => print("Thermostat off");

  @override
  void setTemperature(double temp) => print("Temp set to $temp");

  // ❌ Forced to implement something it cannot do
  @override
  void adjustBrightness(int brightness) =>
      throw UnimplementedError("Thermostats don't have lights!");
}

///
/// Good implementation
///
// 1. Break the fat interface into small, single-purpose roles
abstract class Switchable {
  void turnOn();

  void turnOff();
}

abstract class ClimateControllable {
  void setTemperature(double temp);
}

abstract class Dimmable {
  void adjustBrightness(int brightness);
}

// A smart bulb only cares about power and brightness
class SmartBulb implements Switchable, Dimmable {
  @override
  void turnOn() => print("Light bulb on");

  @override
  void turnOff() => print("Light bulb off");

  @override
  void adjustBrightness(int brightness) => print("Brightness at $brightness%");
}

// A thermostat only cares about power and temperature
class SmartThermostat implements Switchable, ClimateControllable {
  @override
  void turnOn() => print("Thermostat turned on");

  @override
  void turnOff() => print("Thermostat turned off");

  @override
  void setTemperature(double temp) =>
      print("Target temperature set to $temp°C");
}
