import 'package:flutter/material.dart';
import 'package:weather/presentation/Screens/data_api.dart';

class CitiesScreen extends StatelessWidget {
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
    'Asterdam',
    'Quito',
    'Nueva Delhi',
    'Madrid',
    'Paris'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          //TODO: mirar como optimizar el cities screen
          child: Scaffold(
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
                            final route = MaterialPageRoute(
                                builder: (context) => const DataApi());
                            Navigator.push(context, route);
                          },
                        ))
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
