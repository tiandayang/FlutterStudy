import 'package:flutter/material.dart';

import '../util.dart';

class OpacityAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OpacityAnimationState();
  }
}

class OpacityAnimationState extends State<OpacityAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    double begin = 1;
    double end = 0;
    animation = Tween(begin: begin, end: end).animate(controller)
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

  doAnimation() {
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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: '渐变透明度',
          right: controller.isAnimating ? 'stopAnimation' : 'startAnimation',
          color: Colors.blue,
          onPress: () {
            doAnimation();
          }),
      body: Center(
          child: Opacity(
        opacity: animation.value,
        child: Container(
          width: 100,
          height: 100,
          child: Image.asset(
            'images/123.jpg',
            fit: BoxFit.cover,
          ),
        ),
      )),
    );
  }
}
