import 'package:flutter/material.dart';

class DiaryScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  void _saveEntry() {
    final title = titleController.text;
    final content = contentController.text;

    if (title.isNotEmpty && content.isNotEmpty) {
      // Aquí puedes agregar la lógica para guardar la entrada del diario.
      print('Título: $title');
      print('Contenido: $content');
    } else {
      print('Por favor, ingrese un título y contenido');
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
                'Mi diario personal!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Título',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: contentController,
                maxLines: 10,
                decoration: InputDecoration(
                  labelText: 'Contenido',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _saveEntry,
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
