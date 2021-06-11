import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/screen/note_list.dart';

class Note {
  String title;
  var color;

  Note({this.title, this.color = 0xffffcdd2});

  factory Note.fromJson(Map<String, dynamic> json) =>
      Note(title: json['title'], color: json['color']);

  Map<String, dynamic> toJson() => {'title': title, 'color': color};
}

class ShowModel extends GetxController{
  bool show = false;

  void changeState(){
    show = !show;
    update();
  }
}
