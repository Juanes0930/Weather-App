import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            image: AssetImage('assets/Cielo.jpeg'),
          ),
          Center(
              child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              animationDuration: const Duration(milliseconds: 3),
            ),
            onPressed: () {},
            child: const Text(
              'Continue',
              style: TextStyle(fontSize: 30),
            ),
          ))
        ],
      ),
    );
  }
}
