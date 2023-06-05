import 'package:flutter_application_1/model/MainWeather.dart';
import 'package:flutter_application_1/model/Weather.dart';

class Day {
  final int dt;
  final MainWeather main;
  final List<Weather> weather;

  final double wind_speed;
  final int wind_deg;
  final double wind_gust;
  final int visibility;
  final double pop;

  Day({
    required this.dt,
    required this.main,
    required this.weather,
    required this.wind_speed,
    required this.wind_deg,
    required this.wind_gust,
    required this.visibility,
    required this.pop,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      dt: json['dt'],
      main: MainWeather.fromJson(json['main']),
      weather: (json['weather'] as List)
          .map((weather) => Weather.fromJson(weather))
          .toList(),
      wind_speed: double.parse(json['wind']['speed'].toString()),
      wind_deg: json['wind']['deg'],
      wind_gust: double.parse(json['wind']['gust'].toString()),
      visibility: json['visibility'],
      pop: double.parse(json['pop'].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'main': main,
        'weather': weather,
        'wind_speed': wind_speed,
        'wind_deg': wind_deg,
        'wind_gust': wind_gust,
        'visibility': visibility,
        'pop': pop,
      };
}
