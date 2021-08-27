// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:studylayout/AppServer.dart';
// import 'package:studylayout/NetWork.dart';
import 'package:studylayout/util.dart';

class NetRquestDemo extends StatefulWidget {
  @override
  NetRquestDemoSate createState() => NetRquestDemoSate();
}

class NetRquestDemoSate extends State<NetRquestDemo> {
  List<UserCell> cells = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: '网络请求',
          color: Colors.blue[200],
          right: 'request',
          onPress: () {
            doRequest();
          }),
      body: Container(
        child: ListView(
          children: cells,
        ),
      ),
    );
  }

  doRequest() {
    AppServer.netManager.post('/api/v1/config/test', {'id': '123'}, (data) {
      getCells(data);
    }, (code, msg) {
      print(msg);
    });
  }

  getCells(List<dynamic> dics) {
    var lists = [];
    for (var item in dics) {
      var user = User.fromJson(item);
      lists.add(user);
    }
    this.cells = lists.map((e) => UserCell(e)).toList();
    setState(() {});
  }
}

class UserCell extends StatelessWidget {
  final User _user;
  UserCell(this._user);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(_user.userName),
            margin: EdgeInsets.only(left: 20),
          ),
          Text(_user.userId.toString()),
          Text(_user.sexShow()),
          Container(
            child: Text(_user.statusShow()),
            margin: EdgeInsets.only(right: 20),
          )
        ],
      ),
    );
  }
}

class User {
  String userName = '';
  String userId = '';
  Sex sex = Sex.unknow;
  UserStatus userStatus = UserStatus.valid;
  static User fromJson(Map<String, dynamic> dic) {
    var user = User();
    user.userName = dic['userName'];
    user.userId = dic['userId'].toString();
    user.sex = Sex.values[dic['sex']];
    user.userStatus = UserStatus.values[dic['userStatus']];
    return user;
  }

  String sexShow() {
    switch (this.sex) {
      case Sex.unknow:
        return '未知';
      case Sex.male:
        return '男';
      case Sex.female:
        return '女';
      default:
        return '';
    }
  }

  String statusShow() {
    switch (this.userStatus) {
      case UserStatus.valid:
        return '有效';
      case UserStatus.unValid:
        return '无效';
      default:
        return '';
    }
  }
}

enum Sex {
  unknow,
  male,
  female,
}

enum UserStatus { valid, unValid }
