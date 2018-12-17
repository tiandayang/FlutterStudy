import 'package:flutter/material.dart';
import 'package:helloworld2/MyAPPBar.dart';
import 'package:helloworld2/TutorialHome.dart';


class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material 是UI呈现的“一张纸”
    return new Material(
      // Column is 垂直方向的线性布局.
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: Center(
              child: new Text(
                'MyAppBar',
                style: Theme.of(context).primaryTextTheme.title,
              ),
            ),
          ),
          new Expanded(
            child: new Center(
              child: new Text('Hello, world!'),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(
    title: 'Flutter Tutorial',
    home: new TutorialHome(),
  ));
}