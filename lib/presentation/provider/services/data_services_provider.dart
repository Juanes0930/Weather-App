import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../infraestructure/models/weather_data.dart';

class DataServicesProvider extends ChangeNotifier {
  final String _urlSite = 'api.openweathermap.org';
  final String _segment = '/data/2.5/weather';

  String selectedCity = '';
  String temperature = '';
  String humidity = '';
  String windSpeed = '';
  String visibility = '';
  String weatherData = '';
  String timeZone = '';
  String assetUrl = '';
  bool loading = true;

  //List<W>

  DataServicesProvider() {
    print('Iniciando servicios');
    if (selectedCity != '') {
      getDataWeather(selectedCity);
    }
  }

  Future getDataWeather(String citySelected) async {
    String city;
    city = citySelected;
    final queryparams = {
      'q': city,
      'appid': '5d55d5cbc3e7f16b0f685b815c9f0ec3',
      'units': 'metric'
    };

    var url = Uri.https(_urlSite, _segment, queryparams);
    final response = await http.get(url);

    final citiesResponse = WeatherData.fromJson(response.body);

    final decodedData =
        json.decode(response.body); // este creo que se puede borrar
    print(decodedData);
    temperature = citiesResponse.main.temp.toString();
    humidity = citiesResponse.main.humidity.toString();
    windSpeed = citiesResponse.wind.speed.toString();
    visibility = citiesResponse.visibility.toString();
    weatherData = citiesResponse.weather[0].description;
    timeZone = citiesResponse.timezone.toString();
    assetUrl =
        'http://openweathermap.org/img/wn/${citiesResponse.weather[0].icon}@2x.png';
    loading = false;
    //
    // print('tempereture :$temperature');
    // print('humidity : $humidity');
    // print('windSpeed : $windSpeed');
    // print('visibility : $visibility');
    // print('weatherData : $weatherData');
    // print('timeZone :$timeZone');

    notifyListeners();
  }
}
