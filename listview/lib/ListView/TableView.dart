import 'package:flutter/material.dart';
import 'package:listview/ListView/ListModel.dart';

class TableView extends StatelessWidget {

  final List<ListModel> _models;

  TableView(this._models);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
      padding: new EdgeInsets.symmetric(vertical: 8.0),
      children: _children(),
    );
  }

  List<TableViewCell> _children() {
    return _models.map((model) => new TableViewCell(model)).toList();
  }
}

class TableViewCell extends StatelessWidget {
  final ListModel _model;

  TableViewCell(this._model);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
        leading: new CircleAvatar(
            child: new Text(_model.name[0])),
        title: new Text("姓名：" + _model.name),
        subtitle: new Text("年龄：" + _model.age));
  }
}