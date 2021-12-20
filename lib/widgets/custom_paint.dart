import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MyPainter extends CustomPainter {
  // final ui.Image myBackground;
  final List<Offset> points;

  MyPainter(
    this.points,
    // this.myBackground
  );
  @override
  void paint(Canvas canvas, Size size) {
    // canvas.drawImage(myBackground, Offset.zero, Paint());
    const pointMode = ui.PointMode.points;
    final paint = Paint()
      ..color = Colors.red.withOpacity(0.6)
      ..strokeWidth = 70
      ..strokeCap = StrokeCap.round;
    final paintLine = Paint()
      ..color = Colors.greenAccent
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    (points.isNotEmpty) ? canvas.drawPoints(pointMode, points, paint) : () {};
    (points.length > 1)
        ? canvas.drawLine(points[0], points[1], paintLine)
        : () {};
    (points.length > 3)
        ? canvas.drawLine(points[2], points[3], paintLine)
        : () {};
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
