import 'package:flutter/material.dart';

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFF4C631)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    const dashWidth = 10.0;
    const dashSpace = 8.0;
    double distance = 0.0;

    while (distance < size.width) {
      canvas.drawLine(
        Offset(distance, size.height / 2),
        Offset(distance + dashWidth, size.height / 2),
        paint,
      );
      distance += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
