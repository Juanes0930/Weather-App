import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../infraestructure/models/weather_data.dart';

class DataServicesProvider extends ChangeNotifier {
  final String _urlSite = 'api.openweathermap.org';
  final String _segment = '/data/2.5/weather';

  String? getData;
  // ignore: non_constant_identifier_names
  DataServices() {
    print('Iniciando servicios');
    getDataWeather();
  }

  void getDataWeather() async {
    String city;
    city = 'Bello';
    final queryparams = {
      'q': city,
      'appid': '144007da0a2bd09f5c71a6b63ed17545'
    };

    var url = Uri.https(_urlSite, _segment, queryparams);
    final response = await http.get(url);
    final citiesResponse = WeatherData.fromJson(response.body);
    final Map<String, dynamic> decodedData = json.decode(response.body);
    print(decodedData);
    print(citiesResponse.main);
    print(getData = citiesResponse.weather[0].description);
    notifyListeners();
  }
}
