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

  List<CunstomTableViewCell> _children() {
    return _models.map((model) => new CunstomTableViewCell(model)).toList();
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

class CunstomTableViewCell extends StatelessWidget {

  final ListModel _model;
  CunstomTableViewCell(this._model);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.only(top: 10,left: 10,right: 20),
      child: new Row(
        children: [
          new Container(
            child: new CircleAvatar(
                child: new Text(_model.name[1])
            ),
            padding: const EdgeInsets.only(right: 10),
          ),
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: new Text(
                    "姓名：" + _model.name,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  "年龄：" + _model.age,
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),

          new Row(
            children: <Widget>[
              new Icon(
                Icons.star,
                color: Colors.red[500],
              ),
              new Text('41'),
            ],
          )

        ],
      ),
    );
    return titleSection;
  }
}