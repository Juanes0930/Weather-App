import 'package:flutter/material.dart';

class CitiesScreen extends StatelessWidget {
  final List cities = [
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

  CitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SafeArea(
        child: Column(
          children: [
            ListView(
              children: [
                ...cities.map((cities) => ListTile(
                      title: Text(
                        cities,
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Play',
                            color: Colors.white),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined,
                          color: Colors.white),
                      leading:
                          const Icon(Icons.grade_outlined, color: Colors.white),
                      onTap: () {},
                    ))
              ],
            )
          ],
        ),
      ),
    ]);
  }
}
