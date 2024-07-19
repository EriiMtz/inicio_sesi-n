import 'package:flutter/material.dart';
import '../models/user.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void _register(BuildContext context) {
    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        password == confirmPassword) {
      final newUser = User(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        id: '',
      );

      // Redirigir a la pantalla de inicio de sesión con el nuevo usuario registrado
      Navigator.pushReplacementNamed(context, '/', arguments: newUser);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Por favor ingrese todos los datos correctamente')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.pinkAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Regístrate!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 32),
                  _buildTextField(firstNameController, 'Nombre', Icons.person),
                  SizedBox(height: 16),
                  _buildTextField(lastNameController, 'Apellido paterno',
                      Icons.person_outline),
                  SizedBox(height: 16),
                  _buildTextField(
                      emailController, 'Correo electrónico', Icons.email),
                  SizedBox(height: 16),
                  _buildTextField(passwordController, 'Contraseña', Icons.lock,
                      obscureText: true),
                  SizedBox(height: 16),
                  _buildTextField(confirmPasswordController,
                      'Confirmar contraseña', Icons.lock_outline,
                      obscureText: true),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => _register(context),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.pinkAccent,
                      backgroundColor: Colors.white, // Text color
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.pinkAccent),
                      ),
                      elevation: 10.0,
                    ),
                    child: Text('Registrarse', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String labelText, IconData icon,
      {bool obscureText = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.pinkAccent),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.pinkAccent),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        ),
      ),
    );
  }
}
