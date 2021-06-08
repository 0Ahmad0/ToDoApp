import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_todo/models/model.dart';

class NoteController extends GetxController{
  var notes = List<Note>().obs;

  @override
  void onInit() {
    List storedNote = GetStorage().read<List>('notes');
    if(!storedNote.isNull){
      notes = storedNote.map((e) => Note.fromJson(e)).toList().obs;
    }
    ever(notes,(_){
      GetStorage().write('notes',notes.toList());
    });
    super.onInit();
  }
  void addNote(Note n){
    notes.add(n);
  }
}