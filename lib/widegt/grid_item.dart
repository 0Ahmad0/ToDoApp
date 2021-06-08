import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/controller/controller.dart';
import 'package:getx_todo/screen/my_note.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    Key key,
    @required this.noteController,
  }) : super(key: key);

  final NoteController noteController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(5.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 5.0, mainAxisSpacing: 5.0),
      itemCount: noteController.notes.length,
      itemBuilder: (context, index) => Card(
          color: noteController.notes[index].color,
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                Expanded(
                  child: Container(
                      child: SingleChildScrollView(scrollDirection: Axis.vertical,child: Text(noteController.notes[index].title))),
                ),
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
                            middleText: noteController.notes[index].title,
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
    );
  }
}
