import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:easycalculate/pages/calculate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EsayCalc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: AnimatedSplashScreen(
        splashIconSize: 230,
        backgroundColor: const Color.fromARGB(255, 251, 249, 249),
        splashTransition: SplashTransition.scaleTransition,
        splash: CircleAvatar(
          backgroundImage: AssetImage('assets/images/1.png'),
          radius: 120,
        ),
        nextScreen: Calculate(),
      ),
    );
  }
}
