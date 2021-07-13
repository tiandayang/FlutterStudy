import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studylayout/util.dart';

class PhotoWidget extends StatelessWidget {
  final double width;
  final double height;
  final String path;

  PhotoWidget({this.width = double.infinity, this.height, this.path});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: path,
        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

///共享元素
class HeroAnimationPage extends StatefulWidget {
  @override
  HeroAnimationPageState createState() => new HeroAnimationPageState();
}

class HeroAnimationPageState extends State<HeroAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('转场动画'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            titleBarWidget(title: '天门山'),
            sizedBox,
            PhotoWidget(
              width: 600,
              path: 'images/123.jpg',
            ),
            sizedBox,
            buttonWidget(
              title: '查看详情',
              onPressed: () {
                toPage(context, PhotoDetail());
              },
            ),
          ],
        ),
      ),
    );
  }

  void toPage(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }
}

///详情页面
class PhotoDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('详情'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          PhotoWidget(
            width: 200,
            path: 'images/123.jpg',
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
                '\t\t\t\t天门山，古称云梦山、嵩梁山，是张家界永定区海拔最高的山，北距城区8公里，因自然奇观天门洞而得名，最早被记入史册的名山。主峰1518.6米，1992年7月被批准为国家森林公园。'
                '\n\n\t\t\t\t形成罕见的世界奇观――天门洞，天门洞南北对穿，门高131.5米，宽57米，深60米，拔地依天，宛若一道通天的门户，从此而得名天门山，已有1754年历史。山顶相对平坦，保存着完整的原始次森林，有着很多极为珍贵和独特的植物品种，森林覆盖率达90%。其间古树参天，藤蔓缠绕，青苔遍布，石笋、石芽举步皆是，处处如天成的盆景，被世人誉为世界最美的空中花园和天界仙境。2012年7月22日中午，法国轮滑大师让伊夫·布朗杜挑战天门山'),
          ),
        ],
      ),
    );
  }
}
