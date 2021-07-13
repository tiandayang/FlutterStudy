import 'package:flutter/material.dart';

import '../util.dart';

class CircleRadiusAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CircleAnimationState();
  }
}

class CircleAnimationState extends State<CircleRadiusAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<BorderRadius> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    BorderRadius begin = BorderRadius.all(Radius.circular(0));
    BorderRadius end = BorderRadius.all(Radius.circular(50));
    animation = BorderRadiusTween(begin: begin, end: end).animate(controller)
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
          title: '变形',
          right: controller.isAnimating ? 'stopAnimation' : 'startAnimation',
          color: Colors.cyan,
          onPress: () {
            doAnimation();
          }),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            'images/123.jpg',
            fit: BoxFit.cover,
          ),
          decoration: BoxDecoration(borderRadius: animation.value),
        ),
      ),
    );
  }
}
