import 'dart:convert';

class Wind {
  double speed;

  Wind({
    required this.speed,
  });

  factory Wind.fromJson(String str) => Wind.fromMap(json.decode(str));
  factory Wind.fromMap(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
      );
}
