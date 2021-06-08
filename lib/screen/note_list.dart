import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/controller/controller.dart';
import 'package:getx_todo/widegt/grid_item.dart';
import 'package:getx_todo/widegt/list_item.dart';

import 'my_note.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  final NoteController noteController = Get.put(NoteController());

  bool showModel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TODO APP'),
          centerTitle: true,
          actions: [
            IconButton(icon: Icon(
                showModel
                ? Icons.grid_view
                : Icons.format_list_bulleted_outlined
            ), onPressed: () {
             setState(() {
               showModel = !showModel;
               // print(showModel.toString());
             });
            }),
            SizedBox(
              width: 10,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          child: Icon(Icons.add),
          onPressed: () {
            Get.to(MyNote());
          },
        ),
        body: Obx(() => noteController.notes.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No Actions Yet!',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Image.asset('assets/images/empty_todo_list.png')
                  ],
                ),
              )
            : showModel
            ? ListItem(noteController: noteController)
            : GridItem(noteController: noteController)
        ));
  }
}


