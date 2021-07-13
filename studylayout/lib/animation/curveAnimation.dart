import 'package:flutter/material.dart';
import 'package:studylayout/util.dart';

class CustomCurveAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomCurveAnimationState();
  }
}

class CustomCurveAnimationState extends State<CustomCurveAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    var curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    animation = Tween<double>(begin: 0, end: 500).animate(curvedAnimation);
    controller.addListener(() {
      setState(() {});
    });

    controller.addStatusListener((status) {
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
            title: 'curve',
            right: controller.isAnimating ? 'stopAnimation' : 'startAnimation',
            color: Colors.blue[200],
            onPress: () {
              doAnimation();
            }),
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.only(top: animation.value),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: Colors.green,
            ),
          ),
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
