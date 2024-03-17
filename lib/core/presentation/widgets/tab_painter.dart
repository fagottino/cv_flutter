import 'package:flutter/material.dart';

class TabPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.red;

    double width = size.width;
    double height = size.height;
    double cornerSize = 60;

    Path path = Path();
    path.moveTo(width, height);
    path.lineTo(width - cornerSize, height);
    path.lineTo(width, height - cornerSize);
    path.close();

    canvas.drawPath(path, paint);

    const TextSpan span = TextSpan(
      text: 'DEBUG',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );

    final TextPainter textPainter = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(width - height + 10, 5),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
