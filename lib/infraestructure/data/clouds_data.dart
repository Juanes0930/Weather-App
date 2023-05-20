import 'dart:convert';

class Clouds {
  int all;

  Clouds({
    required this.all,
  });

  factory Clouds.fromJson(String str) => Clouds.fromMap(json.decode(str));

  factory Clouds.fromMap(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );
}
