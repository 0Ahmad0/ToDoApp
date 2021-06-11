import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/controller/controller.dart';
import 'package:getx_todo/controller/delete_all_controler.dart';
import 'package:getx_todo/models/model.dart';
import 'package:getx_todo/widegt/grid_item.dart';
import 'package:getx_todo/widegt/list_item.dart';

import 'my_note.dart';




class NoteList extends StatelessWidget {
  final NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowModel>(
          init: ShowModel(),
          builder: (_)=> Scaffold(
                appBar: AppBar(
                  title: Text('ToDo App'),
                  centerTitle: true,
                  leading: GetBuilder<DeleteAllController>(
                    init: DeleteAllController(),
                    builder: (_) => IconButton(
                      icon: Icon(
                        _.icon,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _.deleteAll(noteController.notes);
                      },
                    ),
                  ),
                  actions: [
                    IconButton(
                          icon: Icon(
                              _.show
                                  ? Icons.grid_view
                                  : Icons.format_list_bulleted_outlined
                          ),
                          onPressed: () {
                            _.changeState();
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
                    Get.to(MyNote(), transition: Transition.zoom);
                  },
                ),
                body: Obx(
                      () => noteController.notes.isEmpty
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
                      : _.show
                      ? ListItem(noteController: noteController)
                      : GridItem(noteController: noteController),
                ),
              )
      );
  }
}

