import 'dart:convert';

class Wind {
  double speed;
  int deg;
  double? gust;

  Wind({
    required this.speed,
    required this.deg,
    this.gust,
  });

  factory Wind.fromJson(String str) => Wind.fromMap(json.decode(str));
  factory Wind.fromMap(Map<String, dynamic> json) => Wind(
        speed: json["speed"],
        deg: json["deg"],
        gust: json["gust"],
      );
}
