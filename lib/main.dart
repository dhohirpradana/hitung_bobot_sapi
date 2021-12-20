import 'package:bobot_sapi/pages/foundation.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'pages/splash_screen.dart';

List<CameraDescription>? cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(720, 1440),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: (cameras!.isNotEmpty)
            ? Splash(
                cameras: cameras!,
              )
            : const SizedBox(
                child: Center(
                  child: Text('Tidak mendeteksi kamera'),
                ),
              ),
      ),
    );
  }
}

class Splash extends StatelessWidget {
  final List<CameraDescription> cameras;
  const Splash({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: FoundationPage(cameras: cameras),
      title: const Text(
        'PREDIKSI BOBOT SAPI',
        textScaleFactor: 2,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      image: Image.asset('lib/assets/icon/cow.png'),
      loadingText: const Text("Memuat"),
      photoSize: 100.0,
      loaderColor: Colors.green,
    );
  }
}
