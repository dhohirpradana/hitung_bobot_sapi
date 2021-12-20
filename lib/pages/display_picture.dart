import 'dart:io';
import 'package:bobot_sapi/widgets/circle_floating_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_paint.dart';
import '../getx/get_points.dart';
import '../widgets/substr.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  DisplayPictureScreen({Key? key, required this.imagePath}) : super(key: key);

  final paintsController = Get.put(PointsController());
  _onTapUp(TapUpDetails details) {
    var x = details.globalPosition.dx;
    var y = details.globalPosition.dy;
    (paintsController.points.length < 4)
        ? paintsController.addPoint(Offset(x, y))
        : () {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              circleFloatingWidget(
                  'delete',
                  () => paintsController.deletePoint(),
                  const Icon(
                    Icons.undo,
                    color: Colors.black,
                  ),
                  Colors.white),
              const SizedBox(width: 10),
              circleFloatingWidget(
                  'clear',
                  () => paintsController.clearPoints(),
                  const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  Colors.red[600]),
            ],
          )),
      body: Stack(
        children: [
          Image.file(
            File(imagePath),
            fit: BoxFit.contain,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          GestureDetector(
            onTapUp: (TapUpDetails details) => _onTapUp(details),
            child: Stack(
              children: [
                GetBuilder<PointsController>(
                  builder: (_) => CustomPaint(
                    size: Size(Get.width, Get.height),
                    painter: MyPainter(paintsController.points),
                  ),
                ),
                GetBuilder<PointsController>(
                  builder: (_) => Stack(
                    children: paintsController.children,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 5,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: GetBuilder<PointsController>(
                      builder: (_) => AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: (paintsController.panjang == 0)
                            ? 0
                            : (paintsController.berat == 0)
                                ? 40
                                : 80,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            substrText(
                                'PB',
                                (paintsController.panjang == 0)
                                    ? 0
                                    : (paintsController.panjang > 1000)
                                        ? paintsController.panjang / 1000
                                        : paintsController.panjang,
                                (paintsController.panjang > 1000) ? 'm' : 'cm'),
                            (paintsController.lebar == 0)
                                ? const SizedBox()
                                : substrText(
                                    'LD',
                                    (paintsController.lebar == 0)
                                        ? 0
                                        : (paintsController.lebar > 1000)
                                            ? paintsController.lebar / 1000
                                            : paintsController.lebar,
                                    (paintsController.lebar > 1000)
                                        ? 'm'
                                        : 'cm'),
                            (paintsController.lebar == 0)
                                ? const SizedBox()
                                : substrText(
                                    'BB',
                                    (paintsController.berat == 0)
                                        ? 0
                                        : (paintsController.berat > 1000)
                                            ? paintsController.berat / 1000
                                            : (paintsController.berat > 100)
                                                ? paintsController.berat / 100
                                                : paintsController.berat,
                                    (paintsController.berat > 1000)
                                        ? 't'
                                        : (paintsController.berat > 100)
                                            ? 'kw'
                                            : 'kg'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
