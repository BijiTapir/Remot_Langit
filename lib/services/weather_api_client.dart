import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:cuaca_api/models/weather_model.dart';

class WeatherApiClient{
  Future<Weather>? getCurrentWeather(String? location) async{
    var endpoint = Uri.parse
      ("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=e9a1adc1272a6d2ef3ed1a1fdcf2dfbb&units=metric");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);
    
  }
}