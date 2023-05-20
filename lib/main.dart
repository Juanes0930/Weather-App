import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/presentation/Screens/home.dart';
import 'presentation/Screens/cities_list.dart';
import 'presentation/Screens/data_api.dart';
import 'presentation/provider/services/data_services_provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => DataServicesProvider(), lazy: false),
      ],
      child: const MyApp(),
    );
  }
}

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
        'data': (context) => const DataApi(),
      },
    );
  }
}
