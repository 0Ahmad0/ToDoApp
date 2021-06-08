import 'package:flutter/material.dart';

class CreateButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;

  const CreateButton({
    Key key,
    this.text = '',
    this.color = Colors.white10,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      color: color,
    );
  }
}
