// The Command Pattern
// The Command Pattern turns a request or action into a standalone object that contains all information about the request.
// This transformation lets you pass requests as arguments, delay execution, queue actions, and support undoable operations.
// The Analogy: A Waiter Writing a Food Order
// When you go to a restaurant, you don't walk into the kitchen and shout at the chef.
// Instead, you tell the waiter, who writes your meal request down onto a physical ticket slip (The Command).
// That ticket is an object.
// It can be passed around, placed into a sequence queue on the kitchen rack, or torn up if you change your mind
// and want to Undo your order before cooking starts.

// 1. The Command Interface
abstract class Command {
  void execute();

  void undo();
}

// 2. The Receiver (The object that actually knows how to do the work)
class Light {
  void turnOn() => print("💡 Light is ON");

  void turnOff() => print("🔌 Light is OFF");
}

// 3. Concrete Command
class LightOnCommand implements Command {
  final Light _light;

  LightOnCommand(this._light);

  @override
  void execute() => _light.turnOn();

  @override
  void undo() => _light.turnOff();
}

// 4. The Invoker (The remote control that triggers commands and tracks history)
class RemoteControl {
  final List<Command> _history = [];

  void pressButton(Command command) {
    command.execute();
    _history.add(command); // Save for undo functionality
  }

  void pressUndo() {
    if (_history.isNotEmpty) {
      final lastCommand = _history.removeLast();
      print("↩️ Undoing last action:");
      lastCommand.undo();
    }
  }
}

void main() {
  final livingRoomLight = Light();
  final turnOn = LightOnCommand(livingRoomLight);
  final remote = RemoteControl();

  remote.pressButton(turnOn); // Turns light on
  remote.pressUndo(); // Turns light off automatically!
}
