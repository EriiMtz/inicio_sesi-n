import 'dart:convert';

class Note {
  final String date;
  final String title;
  final String description;

  Note({
    required this.date,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'title': title,
      'description': description,
    };
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      date: json['date'],
      title: json['title'],
      description: json['description'],
    );
  }
}
