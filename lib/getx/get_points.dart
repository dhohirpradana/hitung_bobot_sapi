import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PointsController extends GetxController {
  List<Offset> points = [];
  List<Widget> children = <Widget>[];
  double panjang = 0;
  double lebar = 0;
  // Metode Schoorl
  double berat = 0;
  String halamanText = 'BERANDA';
  void addPoint(Offset data) {
    points.add(data);
    // children.add(
    //     // PointWidget.id(id: points.length - 1, offset: data),
    //     Text(points.length.toString()));
    children.add(Positioned(
        left: data.dx,
        top: data.dy,
        child: RotationTransition(
            turns: const AlwaysStoppedAnimation(90 / 360),
            child: Text((points.length < 3) ? 'PB' : 'LD',
                style: const TextStyle(color: Colors.yellow)))));
    if (points.length > 1) {
      print((points[0] - points[1]).distance);
      panjang = (points[0] - points[1]).distance * 4.000;
    }
    if (points.length > 3) {
      lebar = ((points[2] - points[3]).distance * 4.000) * 2;
      // final lebarInch = lebar / 2.54;
      berat = (panjang + (lebar * lebar)) / 10840;
    }
    update();
  }

  void deletePoint() {
    (points.isNotEmpty) ? points.removeLast() : () {};
    (children.isNotEmpty) ? children.removeLast() : () {};
    if (points.length < 2) {
      panjang = 0;
      berat = 0;
    } else if (points.length > 2 && points.length < 4) {
      lebar = 0;
      berat = 0;
    }
    update();
  }

  void clearPoints() {
    (points.isNotEmpty) ? points.clear() : () {};
    (children.isNotEmpty) ? children.clear() : () {};
    panjang = 0;
    lebar = 0;
    berat = 0;
    update();
  }

  void updatePoint(int id, details) {
    points[id] = details.offset;
    update();
  }
}
