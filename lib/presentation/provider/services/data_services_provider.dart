import 'package:flutter/material.dart';

class DataServicesProvider extends ChangeNotifier {
  final String _urlSite = 'api.openweathermap.org';
  final String _segmen = '/data/2.5/weather';

  String? getData;
  DataServices() {}

  void getDataWeather() async {
    String city = 'Bello';
    final queryparams = {
      'nameCity': city,
      'key': '144007da0a2bd09f5c71a6b63ed17545'
    };

    final url = Uri.https(_urlSite, _segmen, queryparams);

    //TODO: Obtener data api
  }
}
