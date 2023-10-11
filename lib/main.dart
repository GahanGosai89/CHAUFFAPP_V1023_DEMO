import 'package:flutter/material.dart';
import 'package:ways_chauffeur/splash.dart';

import 'Design/Screens/welcome_screen.dart';
import 'home_page.dart';

void main() async {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Poppins',
      primaryColor: const Color(0xff2F8D46),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
    ),
    // theme: ThemeData(fontFamily: 'Inter'),
    initialRoute: 'homePage',
    // initialRoute: 'splash',
// initialRoute: 'myCustomNavigation',
    routes: {
      'homePage': (context) => const WelcomeScreen(),
      // 'splash': (context) => const Splash(),
      /*'mapScreen': (context) => const MapScreen(),
      'homePage': (context) => const HomePage(),
      'surveyScreen': (context) => const SurveyScreen(),*/
    },
  ));
}
