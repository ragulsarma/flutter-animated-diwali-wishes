import 'package:flutter/material.dart';

class LeafPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final outerPaint = Paint()
      ..color = const Color(0xFFFDF1C2) // Outer leaf color
      ..style = PaintingStyle.fill;

    // Paint for the inner leaf
    final innerPaint = Paint()
      ..color = const Color(0xFFFFD700) // Inner leaf (flame) color
      ..style = PaintingStyle.fill;

    final outerPath = Path()
      ..moveTo(size.width / 2, size.height)
      ..quadraticBezierTo(size.width, size.height * 2 / 3, size.width / 2, 0)
      ..quadraticBezierTo(0, size.height * 2 / 3, size.width / 2, size.height)
      ..close(); // Close the path

    // Create the path for the inner leaf shape
    final innerPath = Path()
      ..moveTo(size.width / 2, size.height * 0.9)
      ..quadraticBezierTo(size.width * 0.8, size.height * 0.7, size.width / 2,
          size.height * 0.1)
      ..quadraticBezierTo(size.width * 0.2, size.height * 0.7, size.width / 2,
          size.height * 0.9)
      ..close();

    // Draw the paths
    canvas.drawPath(outerPath, outerPaint); // Draw the outer leaf
    canvas.drawPath(innerPath, innerPaint); // Draw the inner leaf
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
