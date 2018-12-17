import 'package:flutter/material.dart';
import 'package:listview/ListView/TableView.dart';
import 'package:listview/ListView/ListModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TableView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
      appBar: new AppBar(
    title: new Text("Using Listview"),
    ),
    body: new  TableViewScaffold(),
    ),
    );
  }
}

class TableViewScaffold extends StatelessWidget {

  _models(){
    return <ListModel>[
      const ListModel(name: "老刘",age: "26"),
      const ListModel(name: "老二",age: "26"),
      const ListModel(name: "大擦",age: "26"),
      const ListModel(name: "老三",age: "26"),
      const ListModel(name: "老吴",age: "26"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new TableView(_models()),
    );
  }
}