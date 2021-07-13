import 'package:flutter/material.dart';
import 'package:studylayout/util.dart';

class CombineAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CombineAnimationState();
  }
}

class CombineAnimationState extends State<CombineAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Size> size;
  Animation<double> opacity;
  Animation<Offset> offset;
  Animation<BorderRadius> radius;

  var isAnimating = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    size = SizeTween(begin: Size(100, 100), end: Size(200, 200))
        .animate(controller);
    offset = Tween<Offset>(begin: Offset(20, 20), end: Offset(100, 300))
        .animate(controller);
    opacity = Tween<double>(begin: 1, end: 0).animate(controller);

    radius = BorderRadiusTween(
            begin: BorderRadius.all(Radius.circular(50)),
            end: BorderRadius.all(Radius.circular(100)))
        .animate(controller);

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
          title: '组合动画',
          right: controller.isAnimating ? 'stopAnimation' : 'startAnimation',
          color: Colors.deepOrange,
          onPress: () {
            doAnimation();
          }),
      body: Container(
        margin: EdgeInsets.fromLTRB(offset.value.dx, offset.value.dy, 0, 0),
        child: Opacity(
            opacity: opacity.value,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: radius.value),
              width: size.value.width,
              height: size.value.height,
              child: Image.asset(
                'images/123.jpg',
                fit: BoxFit.cover,
              ),
            )),
      ),
    );
  }
}
