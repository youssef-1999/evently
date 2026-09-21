import 'package:evently_application/screens/intro_screen.dart';
import 'package:evently_application/screens/login_screen.dart';
import 'package:evently_application/screens/onboarding_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        OnboardingScreens.routeName: (context) => OnboardingScreens(),
      },
      home: const IntroScreen(),
    );
  }
}
