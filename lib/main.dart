import 'package:flutter/material.dart';
import 'package:weather/presentation/Screens/home.dart';
import 'presentation/Screens/cities_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomeScreen(),
        'cities': (context) => CitiesScreen(),
      },
    );
  }
}
