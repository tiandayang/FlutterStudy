import 'package:flutter/material.dart';

Widget unifyButton({title, onPressed}) {
  return Container(
    margin: EdgeInsets.all(20),
    color: Colors.blue,
    height: 49,
    child: FlatButton(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      onPressed: onPressed,
    ),
  );
}

AppBar customAppBar(
    {String title, String right, Color color, void Function() onPress}) {
  return AppBar(
    title: Text(title),
    backgroundColor: color,
    actions: <Widget>[
      Center(
          child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
        child: GestureDetector(
          child: Text(right),
          onTap: onPress,
        ),
      ))
    ],
  );
}

Widget sizedBox = SizedBox(width: 16, height: 16);

Widget titleBarWidget({title}) {
  return Padding(
    padding: EdgeInsets.all(16),
    child: Text(title),
  );
}

Widget buttonWidget({title, onPressed}) {
  return Container(
    width: 300,
    height: 40,
    color: Colors.green,
    child: FlatButton(
      child: Text(title, style: TextStyle(fontSize: 16, color: Colors.white)),
      onPressed: onPressed,
    ),
  );
}
