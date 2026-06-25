// The Observer Pattern
// The Observer Pattern defines a one-to-many dependency between objects.
// When one object (the Subject) changes its state, all its dependents (Observers) are notified and updated automatically.
// The Analogy: A YouTube Channel Subscription
// Imagine you subscribe to a YouTube channel. You don't check the channel every hour to see if they posted a new video.
// Instead, you click the "Subscribe" button (you become an observer).
// When the creator uploads a new video (state change), YouTube automatically broadcasts a notification to you
// and thousands of other subscribers instantly.
// Flutter/Dart Code Example
// In Flutter, this pattern is built right into the framework via ChangeNotifier, Streams, and ValueNotifier.
// Here is how it looks conceptually:

// 1. The Observer Contract
abstract class Subscriber {
  void update(String videoTitle);
}

// 2. The Subject (The Channel)
class YoutubeChannel {
  final List<Subscriber> _observers = [];
  String? _latestVideo;

  void subscribe(Subscriber observer) => _observers.add(observer);

  void unsubscribe(Subscriber observer) => _observers.remove(observer);

  void uploadVideo(String title) {
    _latestVideo = title;
    print("📺 Channel uploaded: $title");
    _notifyAll();
  }

  void _notifyAll() {
    for (var observer in _observers) {
      observer.update(_latestVideo!);
    }
  }
}

// 3. Concrete Observer
class UserAccount implements Subscriber {
  final String name;

  UserAccount(this.name);

  @override
  void update(String videoTitle) {
    print("🔔 Notification to $name: New video is out -> '$videoTitle'");
  }
}

void main() {
  final channel = YoutubeChannel();
  final alex = UserAccount("Alex");
  final bob = UserAccount("Bob");

  channel.subscribe(alex);
  channel.subscribe(bob);

  channel.uploadVideo("Learn Flutter in 10 Minutes!");
}
