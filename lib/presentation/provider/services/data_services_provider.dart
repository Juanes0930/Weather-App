import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../infraestructure/models/weather_data.dart';

class DataServicesProvider extends ChangeNotifier {
  final String _urlSite = 'api.openweathermap.org';
  final String _segment = '/data/2.5/weather';

  String? getData; // obtiene toda la data
  String selectedCity = '';
  String temperature = '';
  String humidity = '';
  String windSpeed = '';
  String visibility = '';
  String weatherData = '';
  String timeZone = '';

  // ignore: non_constant_identifier_names
  DataServicesProvider() {
    print('Iniciando servicios');
    if (selectedCity != '') {
      getDataWeather(selectedCity);
    }
  }

  Future getDataWeather(String citySelected) async {
    String city;
    city = 'Londres';
    final queryparams = {
      'q': city,
      'appid': '144007da0a2bd09f5c71a6b63ed17545',
      'units': 'metric'
    };

    var url = Uri.https(_urlSite, _segment, queryparams);
    final response = await http.get(url);
    final citiesResponse = WeatherData.fromJson(response.body);
    final decodedData = citiesResponse.weather[0].description;

    print(decodedData);
    temperature = citiesResponse.main.temp.toString();
    humidity = citiesResponse.main.humidity.toString();
    windSpeed = citiesResponse.wind.speed.toString();
    visibility = citiesResponse.visibility.toString();
    weatherData = citiesResponse.weather[0].description;
    timeZone = citiesResponse.timezone.toString();

    print('tempereture :$temperature');
    print('humidity : $humidity');
    print('windSpeed : $windSpeed');
    print('visibility : $visibility');
    print('weatherData : $weatherData');
    print('timeZone :$timeZone');

    notifyListeners();
  }
}
