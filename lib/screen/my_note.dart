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
    List<Color> colors = [
      Colors.red[200],
      Colors.purple[200],
      Colors.pink[200],
      Colors.green[200],
      Colors.blue[200],
      Colors.yellow[200],
      Colors.deepOrange[200],
      Colors.teal[200],
      Colors.indigo[200],
      Colors.cyan[200],
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
                  if(textEditingController.text.isEmpty){
                    Get.snackbar(
                        'Please Write Something',
                        'error happen',
                      snackPosition: SnackPosition.BOTTOM,
                      colorText: Colors.black,
                      backgroundColor: Colors.red[200],
                    );
                  }
                  if(index == null&&(!textEditingController.text.isEmpty)){
                    noteController.notes.add(
                        Note(title: textEditingController.text,color: colors[Random().nextInt(colors.length)]),
                    );
                  } else {
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
