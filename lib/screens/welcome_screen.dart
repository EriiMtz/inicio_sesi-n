import 'package:flutter/material.dart';
import '../models/user.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = ModalRoute.of(context)?.settings.arguments as User?;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.pink.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'WELCOME, ${user?.firstName ?? 'Guest'}!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.account_circle,
                size: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/diary');
                },
                child: Text('Ir a mi diario personal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
