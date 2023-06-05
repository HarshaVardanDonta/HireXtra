class MainWeather {
  final double temp;
  final double feels_like;
  final double temp_min;
  final double temp_max;
  final int pressure;
  final int humidity;
  final int sea_level;
  final int grnd_level;
  final double temp_kf;

  MainWeather({
    required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.humidity,
    required this.sea_level,
    required this.grnd_level,
    required this.temp_kf,
  });

  factory MainWeather.fromJson(Map<String, dynamic> json) {
    return MainWeather(
      temp: json['temp'],
      feels_like: json['feels_like'],
      temp_min: json['temp_min'],
      temp_max: json['temp_max'],
      pressure: json['pressure'],
      humidity: json['humidity'],
      sea_level: json['sea_level'],
      grnd_level: json['grnd_level'],
      temp_kf: double.parse(json['temp_kf'].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'feels_like': feels_like,
        'temp_min': temp_min,
        'temp_max': temp_max,
        'pressure': pressure,
        'humidity': humidity,
        'sea_level': sea_level,
        'grnd_level': grnd_level,
        'temp_kf': temp_kf,
      };
}
