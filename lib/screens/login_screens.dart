import 'package:flutter/material.dart';
import '../models/user.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  User? registeredUser;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    registeredUser = ModalRoute.of(context)?.settings.arguments as User?;
  }

  void _login() {
    final email = emailController.text;
    final password = passwordController.text;

    if (registeredUser != null &&
        email == registeredUser!.email &&
        password == registeredUser!.password) {
      Navigator.pushNamed(context, '/welcome', arguments: registeredUser);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Correo o contraseña incorrectos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.pink.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Mi Diario Personal',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text('¡Iniciar sesión!'),
              SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _login,
                child: Text('Iniciar sesión'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text('Nuevo usuario? Registrarse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
