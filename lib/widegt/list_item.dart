import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/controller/controller.dart';
import 'package:getx_todo/screen/my_note.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key key,
    @required this.noteController,
  }) : super(key: key);

  final NoteController noteController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noteController.notes.length,
      itemBuilder: (context, index) => Card(
        color: noteController.notes[index].color,
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: ListTile(
          title: Text(
            noteController.notes[index].title,
            style: TextStyle(),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.black38,
            child: Text(
              '#${index + 1}',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          trailing: Wrap(
            children: [
              IconButton(
                  icon: Icon(Icons.edit),
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
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
