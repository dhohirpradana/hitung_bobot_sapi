import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PointsController extends GetxController {
  // ! Koordinat LCD/ Layar
  List<Offset> points = [];
  // ! Ui/ Tampilan titik di aplikasi
  List<Widget> children = <Widget>[];
  // ! Panjang Badan dan Lingkar Dada
  double pb = 0;
  double ld = 0;

  double berat = 0;
  String halamanText = 'BERANDA';
  void addPoint(Offset data) {
    points.add(data);
    children.add(Positioned(
        left: data.dx,
        top: data.dy,
        child: RotationTransition(
            turns: const AlwaysStoppedAnimation(90 / 360),
            child: Text((points.length < 3) ? 'PB' : 'LD',
                style: const TextStyle(color: Colors.yellow)))));
    if (points.length > 1) {
      // ! Panjang Badan
      print("PB = " + (points[0] - points[1]).distance.toString());
      // ! Titik adalah Koma
      pb = (points[0] - points[1]).distance * 4.000;
    }
    if (points.length > 3) {
      // ! Lingkar Dada (2x Lebar Dada)
      print("LD = " + (points[2] - points[3]).distance.toString());
      // ! Titik adalah Koma
      ld = ((points[2] - points[3]).distance * 4.000) * 2;
      // ! Rumus menggunakan metode Schoorl untuk memprediksi bobot Sapi
      // * RUMUS Schoorl : (PB + (LD pangkat 2)) / 10840
      berat = (pb + (pow(ld, 2))) / 10840;
      // Pow = Pangkat
    }
    update();
  }

  // ! Hapus titik satu per satu
  void deletePoint() {
    (points.isNotEmpty) ? points.removeLast() : () {};
    (children.isNotEmpty) ? children.removeLast() : () {};
    if (points.length < 2) {
      pb = 0;
      berat = 0;
    } else if (points.length > 2 && points.length < 4) {
      ld = 0;
      berat = 0;
    }
    update();
  }

  // ! Hapus semua titik
  void clearPoints() {
    (points.isNotEmpty) ? points.clear() : () {};
    (children.isNotEmpty) ? children.clear() : () {};
    pb = 0;
    ld = 0;
    berat = 0;
    update();
  }

  void updatePoint(int id, details) {
    points[id] = details.offset;
    update();
  }
}
