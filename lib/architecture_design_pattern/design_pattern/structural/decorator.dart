// The Decorator Pattern
// The Decorator Pattern allows you to dynamically attach new responsibilities and behaviors to an object without altering its original code or using rigid subclassing (inheritance).
// Instead of making a massive class hierarchy (e.g., SecureNetworkClient, LoggingNetworkClient, SecureAndLoggingNetworkClient), you create small decorator wrappers that you can stack on top of each other like Russian nesting dolls.
// Flutter Example: Customizing a Network Client
// Imagine you have a basic client that fetches data, and you want to optionally add logging or encryption to it depending on the environment.

// 1. The Component Interface
abstract class HttpClient {
  Future<String> fetchData(String url);
}

// 2. The Core Concrete Component
class CoreHttpClient implements HttpClient {
  @override
  Future<String> fetchData(String url) async {
    return "{ 'data': 'Success' }"; // Basic fetch
  }
}

// 3. THE DECORATOR BASE
// It holds a reference to another HttpClient and implements the same interface
abstract class HttpClientDecorator implements HttpClient {
  final HttpClient _wrappedClient;

  HttpClientDecorator(this._wrappedClient);

  @override
  Future<String> fetchData(String url) {
    return _wrappedClient.fetchData(url);
  }
}

// 4. Concrete Decorator A: Adds Logging
class LoggingClientDecorator extends HttpClientDecorator {
  LoggingClientDecorator(super.wrappedClient);

  @override
  Future<String> fetchData(String url) async {
    print("--- [LOG] Initiating request to: $url ---");
    final response = await super.fetchData(url);
    print("--- [LOG] Response received ---");
    return response;
  }
}

// 5. Concrete Decorator B: Adds Encryption
class EncryptedClientDecorator extends HttpClientDecorator {
  EncryptedClientDecorator(super.wrappedClient);

  @override
  Future<String> fetchData(String url) async {
    final rawResponse = await super.fetchData(url);
    return "🔐(Encrypted: $rawResponse)"; // Adds encryption behavior
  }
}

// How you dynamically stack them together:
void main() async {
  // Base client
  HttpClient client = CoreHttpClient();

  // Wrap it with logging
  client = LoggingClientDecorator(client);

  // Wrap it AGAIN with encryption
  client = EncryptedClientDecorator(client);

  // Executes core fetch + logging behavior + encryption behavior
  final result = await client.fetchData("https://api.example.com");
  print(result);
}