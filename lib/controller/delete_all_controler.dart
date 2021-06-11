import 'package:get/get.dart';
 import 'package:flutter/material.dart';
class DeleteAllController extends GetxController{
  IconData icon = Icons.select_all;

  void deleteAll(List list){
    list.isEmpty? null:Get.defaultDialog(
        radius: 10.0,
        title: 'Delete ${list.length} Notes?',
        middleText: '💔😪💔',
        buttonColor: Colors.transparent,
        cancelTextColor: Colors.green,
        confirmTextColor: Colors.red,
        onCancel: (){
          Get.back();
        },
        onConfirm: (){
          list.clear();
          Get.back();
        }
    );
  }
}