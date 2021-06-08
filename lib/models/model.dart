import 'package:flutter/material.dart';

class Note {
  String title;
  Color color;

  Note({this.title, this.color});

  factory Note.fromJson(Map<String, dynamic> json) =>
      Note(title: json['title']);

  Map<String, dynamic> toJson() => {
    'title': title,
  };
}
