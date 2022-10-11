import 'dart:convert';

import '../class_weather/class_weather.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static String _apiKey = "6506da8b0a2f389807f9da5c60744565";

  static Future<Weather> fetchCurrentWeather({query, String lat = "", String lon =""}) async {
    var url =
        'http://api.openweathermap.org/data/2.5/weather?q=$query&lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
    final response = await http.post(url);

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');// настраиваем что бы мы могли брать информацию с сайта
    }
  }

  static Future<List<Weather>> fetchHourlyWeather({String query, String lat = "", String lon =""}) async {
    var url =
        'http://api.openweathermap.org/data/2.5/forecast?q=$query&lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
    final response = await http.post(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<Weather> data = (jsonData['list'] as List<dynamic>)
          .map((item) {
        return Weather.fromJson(item);
      }).toList();
      return data;
    } else {
      throw Exception('Failed to load weather');// здесь тоже настраиваем но почасовой поиск уже
    }
  }
}
