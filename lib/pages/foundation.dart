import 'package:bobot_sapi/pages/home.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'about.dart';

class FoundationPage extends StatelessWidget {
  final List<CameraDescription>? cameras;
  const FoundationPage({Key? key, this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Hero(
                        tag: "splashscreenImage",
                        child: Image.asset('lib/assets/icon/cow.png'),
                      ),
                      radius: 100,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    const Text(
                      'PREDIKSI BOBOT SAPI',
                      textScaleFactor: 2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color?>(
                                Colors.green[600]),
                            minimumSize: MaterialStateProperty.all<Size>(
                                Size(Get.width / 1.5, 40))),
                        onPressed: () {
                          Get.to(() => HomePage(cameras: cameras!));
                        },
                        child: const Text('MULAI')),
                    const SizedBox(height: 15),
                    ElevatedButton(
                        style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all<Size>(
                                Size(Get.width / 1.5, 40))),
                        onPressed: () {
                          Get.to(() => const AboutPage());
                        },
                        child: const Text('TENTANG'))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
