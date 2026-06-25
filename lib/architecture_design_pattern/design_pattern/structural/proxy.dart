// The Proxy Pattern
// The Proxy Pattern provides a placeholder or substitute object to control access to the original object. The client thinks it's talking directly to the real service, but the Proxy intercepts the call.
// Proxies are heavily used for:
// •	Lazy Loading (Virtual Proxy): Don't initialize an expensive object until it's absolutely needed.
// •	Access Control (Protection Proxy): Check if a user has admin privileges or auth tokens before executing an operation.
// •	Caching Proxy: Check local cache before forwarding the call to a heavy backend operation.
// Flutter Example: Lazy Loading a Heavy Video Player
// Imagine you have a HeavyVideoPlayer class that allocates a ton of memory when initialized. If you put 50 of these in a scrollable list view, your app will crash. A Proxy can act as a lightweight placeholder until the user actually taps "Play".

// 1. The Common Interface
abstract class VideoPlayer {
  void playVideo();
}

// 2. The Real Subject (Expensive to create)
class HeavyVideoPlayer implements VideoPlayer {
  final String videoUrl;

  HeavyVideoPlayer(this.videoUrl) {
    _initializeHeavyHardware();
  }

  void _initializeHeavyHardware() {
    print(
      "⚠️ Allocating 100MB RAM, initializing hardware decoders for $videoUrl...",
    );
  }

  @override
  void playVideo() {
    print("▶️ Playing video from $videoUrl");
  }
}

// 3. THE PROXY (Cheap to create)
class VideoPlayerProxy implements VideoPlayer {
  final String videoUrl;
  HeavyVideoPlayer? _realPlayer; // Starts as null

  VideoPlayerProxy(this.videoUrl);

  @override
  void playVideo() {
    // Lazy initialization: The heavy object is ONLY created when play is clicked
    if (_realPlayer == null) {
      print("Proxy: First time play clicked. Initializing real player now...");
      _realPlayer = HeavyVideoPlayer(videoUrl);
    }

    _realPlayer!.playVideo();
  }
}

// Inside your ListView.builder:
// Even if you instantiate 100 Proxies, memory usage is virtually zero
// because HeavyVideoPlayer hasn't been initialized yet.
final player = VideoPlayerProxy("video_1.mp4");

// When user taps the list item:
// player.playVideo();
