import 'package:flutter/material.dart';

import 'landingPage.dart';
import 'loginPage.dart';
import 'mainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'landing',
      routes: {
        '/': (context) => MainPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => LoginPage(),
        '/landing': (context) => LandingPage(),
      },
      title: 'MEA',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme(
          primary: Colors.deepPurple,
          primaryVariant: Color(0xFF3700B3),
          secondary: Color(0xFFB71C1C),
          secondaryVariant: Colors.red,
          background: Colors.white70,
          surface: Colors.white30,
          error: Color(0xFFB00020),
          onPrimary: Color(0xFFFFFFFF),
          onSecondary: Colors.white,
          onBackground: Colors.white,
          onSurface: Colors.black87,
          onError: Color(0xFFFFFFFF),
          brightness: Brightness.light,
        ),
      ),
    );
  }
}
