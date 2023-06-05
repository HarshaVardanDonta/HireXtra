class Temp {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  Temp(
      {required this.day,
      required this.min,
      required this.max,
      required this.night,
      required this.eve,
      required this.morn});

  factory Temp.fromJson(Map<String, dynamic> json) {
    return Temp(
        day: json['day'],
        min: json['min'],
        max: json['max'],
        night: json['night'],
        eve: json['eve'],
        morn: json['morn']);
  }

  Map<String, dynamic> toJson() => {
        'day': day,
        'min': min,
        'max': max,
        'night': night,
        'eve': eve,
        'morn': morn
      };
}
