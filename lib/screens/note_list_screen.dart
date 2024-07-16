import 'package:flutter/material.dart';

import 'note_form_screen.dart';

class Note {
  final String date;
  final String title;
  final String description;

  Note({
    required this.date,
    required this.title,
    required this.description,
  });
}

class NoteListScreen extends StatelessWidget {
  final List<Note> notes;

  NoteListScreen({required this.notes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Mis diarios'),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.pinkAccent],
          ),
        ),
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(note.title),
                subtitle: Text(note.date),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(note.title),
                      content: Text(note.description),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cerrar'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Menú',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.pinkAccent,
        onTap: (index) {},
      ),
    );
  }
}
