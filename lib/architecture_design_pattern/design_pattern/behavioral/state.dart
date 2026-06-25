// The State Pattern
// The State Pattern allows an object to alter its behavior when its internal state changes.
// The object will appear to change its entire class layout.
// The Analogy: A Water Dispenser
// Think of a vending machine or water dispenser. If you press the "Dispense" button:
// •	When the machine is in the Has Water state, it pours water into your cup.
// •	When the machine transitions into the Empty state, pressing the exact same button flashes a red error light and does nothing.
// The button doesn't change, but the behavior changes completely based on the internal state.

// 1. The State Contract
abstract class PlayerState {
  void pressPlay(AudioPlayer player);
}

// 2. Concrete State A: Stopped
class StoppedState implements PlayerState {
  @override
  void pressPlay(AudioPlayer player) {
    print("▶️ Starting audio playback...");
    player.changeState(PlayingState()); // Transition state
  }
}

// 3. Concrete State B: Playing
class PlayingState implements PlayerState {
  @override
  void pressPlay(AudioPlayer player) {
    print("⏸️ Pausing audio playback...");
    player.changeState(StoppedState()); // Transition state
  }
}

// 4. The Context (The Player)
class AudioPlayer {
  PlayerState _currentState = StoppedState(); // Initial State

  void changeState(PlayerState newState) {
    _currentState = newState;
  }

  // The client calls this same method, but the behavior morphs
  void tapPlayButton() {
    _currentState.pressPlay(this);
  }
}

void main() {
  final player = AudioPlayer();

  player.tapPlayButton(); // Output: ▶️ Starting audio playback...
  player.tapPlayButton(); // Output: ⏸️ Pausing audio playback...
}
