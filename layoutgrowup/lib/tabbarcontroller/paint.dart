import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points;

  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  bool shouldRepaint(SignaturePainter other) => other.points != points;
}

// ignore: must_be_immutable
class Signature extends StatefulWidget {
  int index;
  Signature(this.index);
  SignatureState createState() => SignatureState(index);
}

class SignatureState extends State<Signature> {
  SignatureState(this.index);
  List<Offset> _points = <Offset>[];
  int index;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("画板" + index.toString()),
          actions: [
            IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  _points.clear();
                  setState(() {});
                })
          ],
        ),
        body: Container(
          color: Colors.white,
          child: GestureDetector(
            onPanUpdate: (DragUpdateDetails details) {
              setState(() {
                RenderBox referenceBox = context.findRenderObject();
                Offset localPosition =
                    referenceBox.globalToLocal(details.localPosition);
                print(localPosition);
                _points = List.from(_points)..add(localPosition);
              });
            },
            onPanEnd: (DragEndDetails details) => _points.add(null),
            child: CustomPaint(
                painter: SignaturePainter(_points), size: Size.infinite),
          ),
        ));
  }
}
