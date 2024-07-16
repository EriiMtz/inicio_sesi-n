import 'package:flutter/material.dart';
import 'screens/login_screens.dart';
import 'screens/register_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/diary_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Diario Personal',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/welcome': (context) => WelcomeScreen(
              userName: '',
            ),
        '/diary': (context) => DiaryScreen(),
      },
    );
  }
}
