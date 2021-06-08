import 'dart:async';

import 'package:flutter/material.dart';
import 'package:getx_todo/screen/note_list.dart';

class WelComeScreen extends StatefulWidget {
  @override
  _WelComeScreenState createState() => _WelComeScreenState();
}

class _WelComeScreenState extends State<WelComeScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => NoteList())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/todoapp.png',
              width: size.width * 0.5,
              height: size.width * 0.5,
            ),
            SizedBox(
              height: size.width * 0.05,
            ),
            Text(
              'ToDo App',
              style: TextStyle(
                  fontSize: size.width * 0.08,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[500]),
            ),
            SizedBox(
              height: size.width * 0.05,
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.transparent,
            ),
            Row()
          ],
        ),
      ),
    );
  }
}
