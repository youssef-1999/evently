import 'package:evently_application/firebase_options.dart';
import 'package:evently_application/screens/home_screen.dart';
import 'package:evently_application/screens/intro_screen.dart';
import 'package:evently_application/auth/login_screen.dart';
import 'package:evently_application/screens/onboarding_screens.dart';
import 'package:evently_application/auth/register_screen.dart';
import 'package:evently_application/theme/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  bool isLoggedIn()
{
  return FirebaseAuth.instance.currentUser == null?false:true;
}

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
          HomeScreen.routeName: (context) => HomeScreen(),
        },
        home: isLoggedIn() ? const HomeScreen() : const IntroScreen(),
      ),
    );
  }
}
