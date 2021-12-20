import 'dart:io';

import 'package:bobot_sapi/widgets/about_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width * 0.9;
    return Scaffold(
      appBar: AppBar(title: const Text('TENTANG')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: cWidth,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aplikasi penghitung bobot sapi metode Schoorl',
                  textAlign: TextAlign.left,
                  style: aboutTextStyle,
                ),
                const SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dibangun menggunakan : ',
                      textAlign: TextAlign.left,
                      style: aboutTextStyle,
                    ),
                    const Text(
                      '- Windows 10',
                      textAlign: TextAlign.left,
                    ),
                    const Text(
                      '- VSCode 1.59.1 ',
                      textAlign: TextAlign.left,
                    ),
                    const Text(
                      '- JDK 11.0.11',
                      textAlign: TextAlign.left,
                    ),
                    const Text(
                      '- Flutter SDK 2.8.0 null-safety',
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(height: Get.height / 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Packages : ',
                      textAlign: TextAlign.left,
                      style: aboutTextStyle,
                    ),
                    const Text(
                      '- camera',
                      textAlign: TextAlign.left,
                    ),
                    const Text(
                      '- flutter_screenutil',
                      textAlign: TextAlign.left,
                    ),
                    const Text(
                      '- get',
                      textAlign: TextAlign.left,
                    ),
                    const Text(
                      '- image_cropper',
                      textAlign: TextAlign.left,
                    ),
                    const Text(
                      '- image_picker',
                      textAlign: TextAlign.left,
                    ),
                    const Text(
                      '- intl',
                      textAlign: TextAlign.left,
                    ),
                    const Text(
                      '- material_design_icons_flutter',
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(height: Get.height / 20),
                Text(
                  'Icon Aplikasi : ',
                  textAlign: TextAlign.left,
                  style: aboutTextStyle,
                ),
                const Text(
                  'Icon made by Victoruler from www.flaticon.com',
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Positioned(
                bottom: 1,
                left: Get.width / 2.8,
                child: Center(
                  child:
                      Text("V 1.0.0 - " + (Platform.isIOS ? "iOS" : "Android")),
                ))
          ],
        ),
      ),
    );
  }
}
