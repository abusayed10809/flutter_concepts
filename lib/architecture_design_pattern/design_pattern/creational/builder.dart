// Builder
// Separates the construction of a complex object from its representation, allowing step-by-step creation.
// In Flutter/Dart, this pattern is frequently used to construct complex network requests, custom HTTP clients, or deeply configured domain objects without polluting the constructor with dozens of optional arguments.

// The Complex Object
class HttpRequest {
  final String url;
  final String method;
  final Map<String, String>? headers;
  final Map<String, dynamic>? body;
  final int timeout;

  HttpRequest._(this.url, this.method, this.headers, this.body, this.timeout);
}

// The Builder
class HttpRequestBuilder {
  String _url = '';
  String _method = 'GET';
  Map<String, String> _headers = {};
  Map<String, dynamic> _body = {};
  int _timeout = 30000;

  HttpRequestBuilder setUrl(String url) {
    _url = url;
    return this; // Return 'this' to allow method chaining
  }

  HttpRequestBuilder setMethod(String method) {
    _method = method;
    return this;
  }

  HttpRequestBuilder addHeader(String key, String value) {
    _headers[key] = value;
    return this;
  }

  HttpRequestBuilder setBody(Map<String, dynamic> body) {
    _body = body;
    return this;
  }

  HttpRequest build() {
    return HttpRequest._(_url, _method, _headers, _body, _timeout);
  }
}

// --- Usage ---
void makeNetworkCall() {
  // Constructing a complex request step-by-step using method chaining
  final request = HttpRequestBuilder()
      .setUrl('https://api.example.com/login')
      .setMethod('POST')
      .addHeader('Authorization', 'Bearer token123')
      .setBody({'username': 'dash'})
      .build();
}
