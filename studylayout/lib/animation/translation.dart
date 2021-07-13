import 'package:flutter/material.dart';

import '../util.dart';

class TranslationAnimation extends StatefulWidget {
  @override
  TranslationAnimationState createState() => TranslationAnimationState();
}

class TranslationAnimationState extends State<TranslationAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    var start = Offset(20, 20);
    var end = Offset(200, 500);
    animation = Tween<Offset>(begin: start, end: end).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        switch (status) {
          case AnimationStatus.completed:
            controller.reverse();
            break;
          case AnimationStatus.dismissed:
            controller.forward();
            break;
          default:
        }
      });
  }

  void doAnimation() {
    if (controller == null) {
      return;
    }
    if (controller.isAnimating) {
      controller.stop();
    } else {
      controller.forward();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: '平移',
          right: controller.isAnimating ? 'stopAnimation' : 'startAnimation',
          color: Colors.yellow,
          onPress: () {
            doAnimation();
          }),
      body: Container(
        margin:
            EdgeInsets.fromLTRB(animation.value.dx, animation.value.dy, 0, 0),
        width: 100,
        height: 100,
        color: Colors.red,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
