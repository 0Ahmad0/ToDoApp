import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_todo/controller/controller.dart';
import 'package:getx_todo/models/model.dart';
import 'package:getx_todo/widegt/create_button.dart';

class MyNote extends StatelessWidget {
  int index;

  MyNote({this.index});

  @override
  Widget build(BuildContext context) {
    final NoteController noteController = Get.find();
    String text = '';
    text = index == null ? '' : noteController.notes[index].title;
    TextEditingController textEditingController =
    new TextEditingController(text: text);
    List<int> colors = [
      0xffffcdd2,
      0xffe1bee7,
      0xfff8bbd0,
      0xffc8e6c9,
      0xffbbdefb,
      0xfffff9c4,
      0xffffccbc,
      0xffb2dfdb,
      0xffc5cae9,
      0xffb2ebf2,
    ];
    return Scaffold(
      appBar: AppBar(
          title: index == null ? Text('Create New Note') : Text('Update Note')),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 40.0
        ),
        children: [
          TextField(
            controller: textEditingController,
            autofocus: true,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: 'Create Note!!',
              labelText: 'My Note',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            style: TextStyle(fontSize: 20),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            maxLines: 5,
          ),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CreateButton(
                onPressed: () {
                  Get.back();
                },
                text: 'Cancel',
                color: Colors.red,
              ),
              CreateButton(
                onPressed: () {
                  if (textEditingController.text.isEmpty) {
                    Get.snackbar(
                      'Please Write Something',
                      'error happen',
                      snackPosition: SnackPosition.BOTTOM,
                      colorText: Colors.black,
                      backgroundColor: Colors.red[200],
                      duration: Duration(seconds: 1),
                    );
                  }
                  if (index == null && (!textEditingController.text.isEmpty)) {
                    noteController.notes.add(
                      Note(
                        title: textEditingController.text,
                        color: colors[Random().nextInt(colors.length)],
                      )
                    );

                  }
                  else {
                    var update = noteController.notes[index];
                    update.title = textEditingController.text;
                    noteController.notes[index] = update;
                  }
                  Get.back();
                },
                text: index == null ? 'Add' : 'Update',
                color: Colors.green,
              ),

            ],
          )
        ],
      ),
    );
  }
}
