import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layoutgrowup/tabbarcontroller/paint.dart';
import 'package:layoutgrowup/tabbarcontroller/TestPage.dart';

class MainTabbarController extends StatefulWidget {
  @override
  MainTabBarControllerState createState() => MainTabBarControllerState();
}

class MainTabBarControllerState extends State<MainTabbarController> {
  final List<BottomNavigationBarItem> tabbars = [
    BottomNavigationBarItem(icon: Icon(Icons.star), title: Text('画板1')),
    BottomNavigationBarItem(icon: Icon(Icons.star), title: Text('test')),
  ];

  final List<Widget> children = [
    Signature(1),
    TestPage(),
  ];

  var selectIndex = 0;
  var currentBody;
  @override
  void initState() {
    super.initState();
    currentBody = children[selectIndex];
  }

  Widget build(Object context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: tabbars,
        currentIndex: selectIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          selectIndex = index;
          currentBody = children[selectIndex];
          setState(() {});
        },
      ),
      body: children[selectIndex],
    );
  }
}
