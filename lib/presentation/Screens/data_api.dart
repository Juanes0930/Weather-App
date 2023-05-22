// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/widgets/columns/custom_columns.dart';
import '../provider/services/data_services_provider.dart';

class DataApi extends StatelessWidget {
  String nameCity = '';
  String temperature = '';
  String humedity = '';
  String windSpeed = '';
  String visibility = '';
  String weatherData = '';
  String timeZone = '';

  DataApi(String city, {super.key}) {
    nameCity = city;
  }

  @override
  Widget build(BuildContext context) {
    //nameCity = Provider.of<DataServicesProvider>(context).name.toUpperCase();
    temperature = '${Provider.of<DataServicesProvider>(context).temperature}°';
    humedity = '${Provider.of<DataServicesProvider>(context).humidity}%';
    windSpeed =
        '${Provider.of<DataServicesProvider>(context).windSpeed} Mts/sec';
    visibility = '${Provider.of<DataServicesProvider>(context).visibility} Mts';
    weatherData = Provider.of<DataServicesProvider>(context).weatherData;
    timeZone = Provider.of<DataServicesProvider>(context).timeZone;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(children: [
            const SizedBox(
              child: Padding(padding: EdgeInsets.all(10)),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 100, bottom: 80, right: 20, left: 20),
                child: Column(
                  children: [
                    Text(nameCity.toUpperCase(),
                        style:
                            const TextStyle(fontSize: 34, fontFamily: 'Play')),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('10: 30 PM', style: TextStyle(fontSize: 16)),
                    Provider.of<DataServicesProvider>(context).loading
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            height: 290,
                            width: double.infinity,
                            child: Image.network(
                                fit: BoxFit.fitHeight,
                                Provider.of<DataServicesProvider>(context)
                                    .assetUrl),
                          ),
                    Text(temperature,
                        style:
                            const TextStyle(fontSize: 40, fontFamily: 'Play')),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(weatherData,
                        style:
                            const TextStyle(fontSize: 18, fontFamily: 'Play')),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(nameCity.toUpperCase(),
                        style:
                            const TextStyle(fontSize: 20, fontFamily: 'Play')),
                    const SizedBox(
                      height: 20,
                    ),
                    //CustomColumns(),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: CustomColumns(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}
