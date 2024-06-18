import 'package:flutter/material.dart';

import '../../constant/theme.dart';

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Membuat garis putus-putus
    final paint = Paint()
      ..color = redColor
      ..strokeWidth = 1;

    const dashWidth = 5.0;
    const dashSpace = 3.0;
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
