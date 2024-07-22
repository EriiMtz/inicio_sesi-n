// screens/welcome_screen.dart

import 'package:flutter/material.dart';
import 'note_form_screen.dart';
import '../models/note.dart';
import '../models/user.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  User? user;
  var notes = <Note>[];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    user = ModalRoute.of(context)?.settings.arguments as User?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '¡Bienvenid@, ${user?.fullName ?? 'Usuario'}!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    final note = notes[index];
                    return Card(
                      color: Colors.white.withOpacity(0.8),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              note.date.split(' ')[0],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.pinkAccent,
                              ),
                            ),
                            Text(
                              note.date.split(' ')[1],
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.pinkAccent,
                              ),
                            ),
                          ],
                        ),
                        title: Text(note.title),
                        subtitle: Text(note.description),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              color: Colors.blueAccent,
                              onPressed: () async {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NoteFormScreen(
                                      userName: user?.fullName ?? 'Usuario',
                                      note: note,
                                    ),
                                  ),
                                );
                                if (result != null && result is Note) {
                                  setState(() {
                                    notes[index] = result;
                                  });
                                }
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              color: Colors.redAccent,
                              onPressed: () {
                                setState(() {
                                  notes.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoteFormScreen(
                        userName: user?.fullName ?? 'Usuario',
                      ),
                    ),
                  );
                  if (result != null && result is Note) {
                    setState(() {
                      notes.add(result);
                    });
                  }
                },
                child: Icon(Icons.add),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.pinkAccent,
                  backgroundColor: Colors.white,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(16),
                ),
              ),
            ],
          ),
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
