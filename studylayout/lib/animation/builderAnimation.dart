import 'dart:math';

import 'package:flutter/material.dart';

import '../util.dart';

class BuilderAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BuilderAnimationState();
  }
}

class BuilderAnimationState extends State<BuilderAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scale;
  Animation<Offset> translation;
  Animation<double> rotate;
  Animation<Color> color;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    scale = Tween<double>(begin: 1, end: 2).animate(controller);
    translation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 300))
        .animate(controller);
    rotate = Tween<double>(begin: 0, end: pi * 2).animate(controller);
    color =
        ColorTween(begin: Colors.green, end: Colors.cyan).animate(controller);
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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: 'builderAnimation',
          right: controller.isAnimating ? 'stopAnimation' : 'startAnimation',
          color: color.value,
          onPress: () {
            doAnimation();
          }),
      body: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: rotate.value,
                        child: Container(
                          width: 80,
                          height: 80,
                          color: color.value,
                        ),
                      );
                    },
                  ),
                  AnimatedBuilder(
                      animation: controller,
                      builder: (context, chuild) {
                        return Transform.scale(
                          scale: scale.value,
                          child: Container(
                            width: 80,
                            height: 80,
                            color: color.value,
                          ),
                        );
                      }),
                  AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: translation.value,
                          child: Container(
                            width: 80,
                            height: 80,
                            color: color.value,
                          ),
                        );
                      })
                ],
              ),
              Container(
                height: 20,
              ),
              AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: translation.value,
                      child: Transform.rotate(
                          angle: rotate.value,
                          child: Transform.scale(
                            scale: scale.value,
                            child: Container(
                              width: 80,
                              height: 80,
                              color: color.value,
                              child: Icon(
                                Icons.stars,
                                color: Colors.white,
                              ),
                            ),
                          )),
                    );
                  }),
            ],
          )),
    );
  }
}
