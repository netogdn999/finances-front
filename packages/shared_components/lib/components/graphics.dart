import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vmath;

class Graphics extends StatelessWidget {
  final double width;
  final Color color;
  final double? height;

  const Graphics({Key? key, this.width = 26, this.color = Colors.white, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: GraphPaint(width: width, color: color),
        child: Container(),
      ),
    );
  }

  static Graphics fromDto(GraphicsContract contract) {
    int? colorCode = contract.color;
    Color color;
    if (colorCode != null) {
      color = Color(colorCode);
    } else {
      color = Colors.white;
    }
    return Graphics(width: contract.width ?? 26, color: color, height: contract.height,);
  }
}

class GraphPaint extends CustomPainter {
  final double width;
  final Color color;

  GraphPaint({required this.width, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawArc(
        Rect.fromCenter(
            center: center, width: size.width - 30, height: size.height - 30),
        vmath.radians(135),
        vmath.radians(274),
        false,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..color = const Color.fromARGB(60, 250, 250, 250)
          ..strokeWidth = width);

    canvas.saveLayer(
        Rect.fromCenter(
            center: center, width: size.width - 30, height: size.height - 30),
        Paint());

    canvas.drawArc(
        Rect.fromCenter(
            center: center, width: size.width - 30, height: size.height - 30),
        vmath.radians(135),
        vmath.radians(127),
        false,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..color = color
          ..strokeWidth = width);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
