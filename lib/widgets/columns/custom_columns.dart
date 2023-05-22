import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presentation/provider/services/data_services_provider.dart';
import '../../shared/exports/exports.dart';

class CustomColumns extends StatelessWidget {
  String nameCity = '';
  String temperature = '';
  String humedity = '';
  String windSpeed = '';
  String visibility = '';
  String weatherData = '';
  String timeZone = '';

  CustomColumns({super.key}) {}

  @override
  Widget build(BuildContext context) {
    temperature = '${Provider.of<DataServicesProvider>(context).temperature}°';
    humedity = '${Provider.of<DataServicesProvider>(context).humidity}%';
    windSpeed =
        '${Provider.of<DataServicesProvider>(context).windSpeed} Mts/sec';
    visibility = '${Provider.of<DataServicesProvider>(context).visibility} Mts';
    weatherData = Provider.of<DataServicesProvider>(context).weatherData;
    timeZone = Provider.of<DataServicesProvider>(context).timeZone;

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Icon(Icons.remove_red_eye_outlined),
              const SizedBox(height: 5),
              const Text('Visibility',
                  style: TextStyle(fontSize: 20, fontFamily: 'Play')),
              const SizedBox(height: 10),
              Text(visibility,
                  style: const TextStyle(fontSize: 16, fontFamily: 'Play'))
            ],
          ),
          Column(
            children: [
              const Icon(Icons.air_outlined),
              const Text('Wind',
                  style: TextStyle(fontSize: 20, fontFamily: 'Play')),
              Text(windSpeed,
                  style: const TextStyle(fontSize: 16, fontFamily: 'Play'))
            ],
          ),
          Column(
            children: [
              const Icon(Icons.thermostat_auto_outlined),
              const Text('Temp',
                  style: TextStyle(fontSize: 20, fontFamily: 'Play')),
              Text(temperature,
                  style: const TextStyle(fontSize: 16, fontFamily: 'Play'))
            ],
          ),
        ],
      ),
    );
  }
}
