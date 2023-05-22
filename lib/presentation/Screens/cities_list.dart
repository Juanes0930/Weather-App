import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather/presentation/Screens/data_api.dart';

import '../provider/services/data_services_provider.dart';

class CitiesScreen extends StatefulWidget {
  const CitiesScreen({super.key});

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  final cities = [
    'Tokio',
    'San Francisco',
    'Brasilia',
    'Bogota',
    'Moscu',
    'Osaka',
    'Santiago',
    'Londres',
    'New York',
    'Roma',
    'La Habana',
    'Amsterdam',
    'Quito',
  ];

  String lat = '';
  String lon = '';
  Position? position;

  @override
  Widget build(BuildContext context) {
    Future<bool> _handleLocationPermission() async {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Los servicios de localización están desactivados. Por favor, active los servicios')));
        return false;
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Los permisos de localización están denegados')));
          return false;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Los permisos de localización están denegados, no se pueden solicitar los permisos.')));
        return false;
      }
      return true;
    }

    // 6.330111-75.5670599
    Future<void> _showMyDialog() {
      //TODO: agregar parametro texto pocision,
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Ubicación'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(
                      'Tu ubicación actual es: Latitud: $lat y Longitud: $lon'), // cambiar por la pocision
                  //  Text('Would you like to approve of this message?'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Cerrar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> _getCurrentPosition() async {
      final hasPermission = await _handleLocationPermission();
      if (!hasPermission) return;
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((Position position) {
        lat = position.latitude.toString();
        lon = position.longitude.toString();
        _showMyDialog();
      }).catchError((e) {
        print('ERROR : ' + e.toString());
        debugPrint(e);
      });
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.black,
                child: const Icon(
                  Icons.location_on_rounded,
                  size: 35,
                ),
                onPressed: () {
                  _getCurrentPosition();
                }),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniEndDocked,
            body: Stack(children: [
              SafeArea(
                child: ListView(
                  children: [
                    ...cities.map((cities) => ListTile(
                          title: Text(
                            cities,
                            style: const TextStyle(
                                fontSize: 22,
                                fontFamily: 'Play',
                                color: Colors.black),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios_outlined,
                              color: Colors.black),
                          leading: const Icon(Icons.grade_outlined,
                              color: Colors.black),
                          onTap: () {
                            Provider.of<DataServicesProvider>(context,
                                    listen: false)
                                .getDataWeather(cities);

                            final route = MaterialPageRoute(
                                builder: (context) => DataApi(cities));
                            Navigator.push(context, route);
                          },
                        )),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
//}
