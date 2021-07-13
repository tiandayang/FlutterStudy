import 'package:flutter/material.dart';
import 'package:studylayout/util.dart';

import 'animation/animationIndex.dart';

class RootView extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset(
            "images/123.jpg",
            fit: BoxFit.cover,
            height: 200,
          ),
          TitleView(),
          MenuItemView(),
          Container(
              margin: EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: Text(
                '312312312312312321312312312312321n3kkdsfhwkhihdfkissdajksdhkajhdjahdkjashdjkahsdkajsdhjkashdkahdhdanskdhjcsfhwfjoncofowhos',
                style: TextStyle(color: Colors.red),
                maxLines: 3,
              )),
          unifyButton(
              title: "动画",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CustomAnimation()));
              }),
        ],
      ),
    );
  }
}

class TitleView extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '上面是一张图片',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  '上面是一张图片和一段文字',
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
              ],
            ),
          ),
          Icon(
            Icons.face,
            color: Colors.red,
            size: 14,
          ),
          Text(
            '41',
            style: TextStyle(fontSize: 12, color: Colors.red),
          ),
        ],
      ),
    );
  }
}

class MenuItemView extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildStackView(Icons.call, '打电话'),
        buildStackView(Icons.share, '分享'),
        buildStackView(Icons.router, '导航'),
      ],
    ));
  }

  Column buildStackView(IconData icon, String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: Colors.blue,
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(
            text,
            style: TextStyle(color: Colors.blue, fontSize: 12),
          ),
        )
      ],
    );
  }
}
