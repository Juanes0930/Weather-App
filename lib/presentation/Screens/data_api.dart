import 'package:flutter/material.dart';

class DataApi extends StatelessWidget {
  const DataApi({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SizedBox(
              child: ColorFiltered(
                  colorFilter:
                      ColorFilter.mode(Colors.green, BlendMode.clear))),
        ));
  }
}
