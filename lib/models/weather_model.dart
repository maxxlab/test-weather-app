// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Weather {
  final String id;
  final String name;
  final String main;
  final String description;
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int humidity;
  final double windSpeed;

  Weather({
    required this.id,
    required this.name,
    required this.main,
    required this.description,
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.windSpeed,
  });

  Weather copyWith({
    String? id,
    String? name,
    String? main,
    String? description,
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? humidity,
    double? windSpeed,
  }) {
    return Weather(
      id: id ?? this.id,
      name: name ?? this.name,
      main: main ?? this.main,
      description: description ?? this.description,
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      humidity: humidity ?? this.humidity,
      windSpeed: windSpeed ?? this.windSpeed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'main': main,
      'description': description,
      'temp': temp,
      'feelsLike': feelsLike,
      'tempMin': tempMin,
      'tempMax': tempMax,
      'humidity': humidity,
      'windSpeed': windSpeed,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['id'] as String,
      name: map['name'] as String,
      main: map['main'] as String,
      description: map['description'] as String,
      temp: map['temp'] as double,
      feelsLike: map['feelsLike'] as double,
      tempMin: map['tempMin'] as double,
      tempMax: map['tempMax'] as double,
      humidity: map['humidity'] as int,
      windSpeed: map['windSpeed'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(Map<String, dynamic> json) {
    final weatherData = json['weather'][0];
    return Weather(
      id: 'id',
      name: json['name'],
      main: weatherData['main'],
      description: weatherData['description'],
      temp: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      tempMin: json['main']['temp_min'].toDouble(),
      tempMax: json['main']['temp_max'].toDouble(),
      humidity: json['main']['humidity'].toInt(),
      windSpeed: json['wind']['speed'].toDouble(),
    );
  }

  @override
  String toString() {
    return 'Weather(id: $id, name: $name, main: $main, description: $description, temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, humidity: $humidity, windSpeed: $windSpeed)';
  }

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.main == main &&
        other.description == description &&
        other.temp == temp &&
        other.feelsLike == feelsLike &&
        other.tempMin == tempMin &&
        other.tempMax == tempMax &&
        other.humidity == humidity &&
        other.windSpeed == windSpeed;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        main.hashCode ^
        description.hashCode ^
        temp.hashCode ^
        feelsLike.hashCode ^
        tempMin.hashCode ^
        tempMax.hashCode ^
        humidity.hashCode ^
        windSpeed.hashCode;
  }
}
