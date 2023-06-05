import 'package:flutter_application_1/model/City.dart';

import 'Day.dart';

class FullWeather {
  final City city;
  final String cod;
  final int message;
  final int cnt;
  final List<Day> list;

  FullWeather({
    required this.city,
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
  });

  factory FullWeather.fromJson(Map<String, dynamic> json) {
    return FullWeather(
      city: City.fromJson(json['city']),
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      list: (json['list'] as List).map((day) => Day.fromJson(day)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'city': city,
        'cod': cod,
        'message': message,
        'cnt': cnt,
        'list': list,
      };
}
