// The Repository Pattern
// The Repository Pattern is a structural pattern heavily utilized in modern architecture (like Clean Architecture or Layered Architecture). It isolates the data layer from the business logic layer, deciding whether to fetch data from a local SQLite cache or a remote web API.
// Flutter Example: Fetching Weather Data
// Your business logic layer (like a Bloc or Cubit) shouldn't care where the data comes from; it just wants the data.

class Weather {
  final double temperature;

  Weather(this.temperature);
}

// 1. Define the repository contract
abstract class WeatherRepository {
  Future<Weather> getWeather();
}

// 2. Concrete implementation handling the structure of data sources
class WeatherRepositoryImpl implements WeatherRepository {
  final LocalDatabaseCache _cache = LocalDatabaseCache();
  final RemoteWeatherApi _api = RemoteWeatherApi();
  final NetworkInfo _network = NetworkInfo();

  @override
  Future<Weather> getWeather() async {
    // Structural Logic: Deciding data flow based on device state
    if (await _network.isConnected) {
      final remoteData = await _api.fetchCurrentWeather();
      await _cache.saveToCache(remoteData);
      return remoteData;
    } else {
      return await _cache.getCachedWeather();
    }
  }
}

// Dummy classes representing data sources
class LocalDatabaseCache {
  Future<Weather> getCachedWeather() async => Weather(22.0);

  Future<void> saveToCache(Weather w) async {}
}

class RemoteWeatherApi {
  Future<Weather> fetchCurrentWeather() async => Weather(25.5);
}

class NetworkInfo {
  Future<bool> get isConnected async => true;
}
