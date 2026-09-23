import 'package:evently_application/firebase_options.dart';
import 'package:evently_application/screens/intro_screen.dart';
import 'package:evently_application/screens/login_screen.dart';
import 'package:evently_application/screens/onboarding_screens.dart';
import 'package:evently_application/screens/register_screen.dart';
import 'package:evently_application/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: AppTheme.themeMode,
      builder: (context, mode, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: mode,
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          RegisterScreen.routeName: (context) => RegisterScreen(),
          OnboardingScreens.routeName: (context) => OnboardingScreens(),
        },
        home: const IntroScreen(),
      ),
    );
  }
}
