import 'package:flutter/material.dart';

class DataApi extends StatelessWidget {
  const DataApi({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(children: [
            SizedBox(
              child: Padding(padding: EdgeInsets.all(10)),
            ),
            Center(
              child: Padding(
                padding:
                    EdgeInsets.only(top: 150, bottom: 100, right: 20, left: 40),
                child: Column(
                  children: [
                    Text('PARIS', style: TextStyle(fontSize: 30)),
                    SizedBox(
                      height: 10,
                    ),
                    Text('TUESDAY 10:35 PM', style: TextStyle(fontSize: 16)),
                    SizedBox(
                      height: 35,
                    ),
                    Icon(
                      Icons.sunny,
                      size: 150,
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Text('35°C', style: TextStyle(fontSize: 30)),
                    SizedBox(
                      height: 20,
                    ),
                    Text('overcast clouds', style: TextStyle(fontSize: 16)),
                    SizedBox(
                      height: 20,
                    ),
                    Text('PARIS', style: TextStyle(fontSize: 20)),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.sunny_snowing,
                            size: 50,
                          ),
                          SizedBox(
                            width: 90,
                          ),
                          Icon(
                            Icons.wind_power,
                            size: 50,
                          ),
                          SizedBox(width: 90),
                          Icon(
                            Icons.device_thermostat_outlined,
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        children: [
                          Text('Strong Rain'),
                          SizedBox(
                            width: 52,
                          ),
                          Text('Speed Wind'),
                          SizedBox(width: 52),
                          Text('Temperature'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text('6.00'),
                          SizedBox(
                            width: 90,
                          ),
                          Text('10m/s'),
                          SizedBox(width: 110),
                          Text('49°'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}
