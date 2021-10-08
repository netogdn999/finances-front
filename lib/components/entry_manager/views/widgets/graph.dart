import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vmath;

class Graph extends StatelessWidget {
  final double width;
  const Graph({Key? key, this.width = 26}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GraphPaint(width: width),
      child: Container(),
    );
  }
}

class GraphPaint extends CustomPainter {
  final double width;

  GraphPaint({required this.width});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawArc(
      Rect.fromCenter(center: center, width: size.width - 30, height: size.height - 30), 
      vmath.radians(135),
      vmath.radians(274),
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..color = Color.fromARGB(60, 250, 250, 250)
        ..strokeWidth = width
    );

    canvas.saveLayer(
      Rect.fromCenter(center: center, width: size.width - 30, height: size.height - 30),
      Paint()
    );

    canvas.drawArc(
      Rect.fromCenter(center: center, width: size.width - 30, height: size.height - 30),
      vmath.radians(135),
      vmath.radians(127),
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..color = Colors.white
        ..strokeWidth = width
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}