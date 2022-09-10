import 'package:first_app/data/weather.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

class HttpHelper {
 // https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=e199a7bbd0c266a03cf6d74c7c2d5dd2
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = 'e199a7bbd0c266a03cf6d74c7c2d5dd2';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> paramiters = {'q': location, 'appID': apiKey};
    Uri uri = Uri.https(authority, path, paramiters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);
    return weather;
  }

}