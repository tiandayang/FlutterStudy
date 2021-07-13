import 'package:flutter/material.dart';
import 'package:studylayout/animation/builderAnimation.dart';
import 'package:studylayout/animation/circleRadius.dart';
import 'package:studylayout/animation/combine.dart';
import 'package:studylayout/animation/curveAnimation.dart';
import 'package:studylayout/animation/listanimation.dart';
import 'package:studylayout/animation/opacity.dart';
import 'package:studylayout/animation/transformScale.dart';
import 'package:studylayout/animation/translation.dart';

import 'heroanimation.dart';

class CustomAnimation extends StatefulWidget {
  @override
  AnimationState createState() => AnimationState();
}

class AnimationState extends State<CustomAnimation> {
  @override
  Widget build(Object context) {
    return Scaffold(
      // color: Colors.white,
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: ListView(
        children: animations().map((e) => AnimationItemCell(e)).toList(),
      ),
    );
  }
}

class AnimationItemCell extends StatelessWidget {
  final AnimationItem _model;
  AnimationItemCell(this._model);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
          // padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(child: Text(_model.title)),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey[500],
                    size: 15,
                  )
                ],
              ),
              Container(
                height: 1,
                margin: EdgeInsets.only(top: 10),
                color: Colors.grey[200],
              )
            ],
          )),
      onTap: () {
        switch (_model.title) {
          case '缩放':
            push(context, ZoomAnimation());
            break;
          case '平移':
            push(context, TranslationAnimation());
            break;
          case '变形':
            push(context, CircleRadiusAnimation());
            break;
          case '渐变透明度':
            push(context, OpacityAnimation());
            break;
          case '组合':
            push(context, CombineAnimation());
            break;
          case 'curved':
            push(context, CustomCurveAnimation());
            break;
          case 'builder':
            push(context, BuilderAnimation());
            break;
          case '列表动画':
            push(context, ListAnimation());
            break;
          case '转场动画':
            push(context, HeroAnimationPage());
            break;
          default:
        }
      },
    );
  }

  push(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }
}

class AnimationItem {
  var title = '';
  AnimationItem(this.title);
}

List<AnimationItem> animations() {
  // List<String> titles = ['补间动画'];
  return [
    AnimationItem('缩放'),
    AnimationItem('平移'),
    AnimationItem('变形'),
    AnimationItem('渐变透明度'),
    AnimationItem('组合'),
    AnimationItem('curved'),
    AnimationItem('builder'),
    AnimationItem('列表动画'),
    AnimationItem('转场动画'),
  ];
}
