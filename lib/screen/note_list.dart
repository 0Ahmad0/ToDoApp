import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/controller/controller.dart';

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
               print(showModel.toString());
             });
            }),
            SizedBox(
              width: 10,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
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
            ?  ListView.builder(
          itemCount: noteController.notes.length,
          itemBuilder: (context, index) => Card(
            color: noteController.notes[index].color,
            margin: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0
            ),
            child: ListTile(
              title: Text(noteController.notes[index].title,style: TextStyle(),),
              leading: CircleAvatar(
                backgroundColor: Colors.black38,
                child: Text(
                  '#${index+1}',
                  style: TextStyle(
                      fontSize: 18,
                    color: Colors.white
                  ),
                ),
              ),
              trailing: Wrap(
                children: [
                  IconButton(icon: Icon(Icons.edit), onPressed: (){
                    Get.to(MyNote(index: index,));
                  }),
                  IconButton(icon: Icon(Icons.delete,color: Colors.red,), onPressed: (){
                    Get.defaultDialog(
                      cancelTextColor: Colors.green,
                      confirmTextColor: Colors.red,
                      buttonColor: Colors.transparent,
                      title: 'Delete Note',
                      middleText: noteController.notes[index].title,
                      onCancel: ()=>Get.back(),
                      onConfirm: (){
                        noteController.notes.removeAt(index);
                        Get.back();
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        )
            :GridView.builder(
          padding: EdgeInsets.all(5.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0),
          itemCount: noteController.notes.length,
          itemBuilder: (context, index) => Card(
              color: noteController.notes[index].color,
              margin:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black38,
                      child: Text(
                        '#${index + 1}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Flexible(
                        child: Text(noteController.notes[index].title)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.black38,
                            ),
                            onPressed: () {
                              Get.to(MyNote(
                                index: index,
                              ));
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              Get.defaultDialog(
                                cancelTextColor: Colors.green,
                                confirmTextColor: Colors.red,
                                buttonColor: Colors.transparent,
                                title: 'Delete Note',
                                middleText:
                                noteController.notes[index].title,
                                onCancel: () => Get.back(),
                                onConfirm: () {
                                  noteController.notes.removeAt(index);
                                  Get.back();
                                },
                              );
                            })
                      ],
                    )
                  ],
                ),
              )),
        )
        ));
  }
}
