class City {
  final int id;
  final String name;
  final String country;
  final int population;
  final int timezone;
  final double lat;
  final double lon;

  City({
    required this.id,
    required this.name,
    required this.country,
    required this.population,
    required this.timezone,
    required this.lat,
    required this.lon,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      country: json['country'],
      population: json['population'],
      timezone: json['timezone'],
      lat: json['coord']['lat'],
      lon: json['coord']['lon'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'country': country,
        'population': population,
        'timezone': timezone,
        'lat': lat,
        'lon': lon,
      };
}
