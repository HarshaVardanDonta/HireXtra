import 'dart:convert';

import 'package:flutter_application_1/model/FullWeather.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static getWeather({required int days}) async {
    var url = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&appid=3ea1b8b83b7a6a910ded1ab9fc644097&cnt=$days&units=metric"));
    var response = jsonDecode(url.body);

    FullWeather fullWeather = FullWeather.fromJson(response);
    if (response['cod'] == '200') {
      return fullWeather;
    } else {
      return null;
    }
  }
}
