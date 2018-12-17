import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});
  final Widget title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 88,
      color: Color.fromRGBO(222, 222, 123, 0.5),
      child: new Row(
      children: <Widget>[
        new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null, // null 会禁用 button
        ),
        // Expanded expands its child to fill the available space.
        new Expanded(
          child: title,
        ),
        new IconButton(
          icon: new Icon(Icons.search),
          tooltip: 'Search',
          onPressed: null,
        ),
      ],

      ),
    );
  }

}
