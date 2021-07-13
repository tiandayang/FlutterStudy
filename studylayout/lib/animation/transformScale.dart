import 'package:flutter/material.dart';

import '../util.dart';

class ZoomAnimation extends StatefulWidget {
  @override
  ZoomAnimationState createState() => ZoomAnimationState();
}

class ZoomAnimationState extends State<ZoomAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Size> animation;
  var isAnimating = false;

  @override
  void initState() {
    super.initState();
    var animationController = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    controller = animationController;
    Size begin = Size(100, 100);
    Size end = Size(300, 300);
    animation = SizeTween(begin: begin, end: end).animate(controller)
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
      isAnimating = false;
      controller.stop();
    } else {
      isAnimating = true;
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
          title: 'zoom',
          right: controller.isAnimating ? 'stopAnimation' : 'startAnimation',
          color: Colors.pink,
          onPress: () {
            doAnimation();
          }),
      body: Center(
        child: Container(
          color: Colors.blue,
          width: animation.value.width,
          height: animation.value.height,
          child: Image.asset('images/123.jpg'),
        ),
      ),
    );
  }
}
