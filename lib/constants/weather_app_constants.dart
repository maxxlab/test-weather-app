class WeatherAppConstants {
  static const String weatherApiKey = '46a78121a221a2e50b32db84d12f0562';

  static String cityForecast(String city) =>
      'https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$weatherApiKey';
      
  static String cityForecastByLocation(double lat, double lon) =>
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=$weatherApiKey';
}
