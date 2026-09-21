import 'package:evently_application/main.dart';
import 'package:evently_application/screens/intro_screen.dart';
import 'package:evently_application/screens/onboarding_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App starts on the intro screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(IntroScreen), findsOneWidget);
  });

  testWidgets('Onboarding starts on the second design page', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: OnboardingScreens()));

    expect(find.text('Find Events That Inspire You'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);
    expect(find.text('Previous'), findsNothing);
  });
}
