// ignore_for_file: use_key_in_widget_constructors

import 'package:bobot_sapi/getx/get_points.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PointWidget extends StatelessWidget {
  final int id;
  final Offset offset;
  PointWidget.id({required this.id, required this.offset});

  final paintsController = Get.put(PointsController());

  @override
  Widget build(BuildContext context) {
    print(paintsController.points[id].dx);
    print(paintsController.points[id].dy);
    return GetBuilder<PointsController>(
      builder: (_) => Positioned(
        left: paintsController.points[id].dx,
        top: paintsController.points[id].dy,
        child: RotationTransition(
          turns: const AlwaysStoppedAnimation(90 / 360),
          child: Draggable(
            feedback: Container(
              padding: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.5),
                  shape: BoxShape.circle),
              child: Text(
                id.toString(),
                style: const TextStyle(color: Colors.yellow),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.5),
                  shape: BoxShape.circle),
              child: Text(
                id.toString(),
                style: const TextStyle(color: Colors.yellow),
              ),
            ),
            childWhenDragging: Container(
              padding: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.5),
                  shape: BoxShape.circle),
              child: Text(
                id.toString(),
                style: const TextStyle(color: Colors.yellow),
              ),
            ),
            onDragUpdate: (details) {
              paintsController.updatePoint(id, details);
            },
            onDragEnd: (details) {
              paintsController.updatePoint(id, details);
            },
          ),
        ),
      ),
    );
  }
}
