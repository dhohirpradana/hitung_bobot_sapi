import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'display_picture.dart';

class HomePage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const HomePage({Key? key, required this.cameras}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CameraController? controller;
  late Future<void> initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    controller = (widget.cameras.isNotEmpty)
        ? CameraController(widget.cameras[0], ResolutionPreset.max)
        : null;
    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      initializeControllerFuture = controller!.initialize();
      // controller!.setFlashMode(FlashMode.off);
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _capture() async {
    try {
      await initializeControllerFuture;
      final image = await controller!.takePicture();
      Get.to(() => DisplayPictureScreen(imagePath: image.path));
    } catch (e) {
      // If an error occurs, log the error to the console.
      // print(e);
    }
  }

  void pickImageGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File? croppedFile = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioX: Get.width, ratioY: Get.height),
        aspectRatioPresets: [
          // CropAspectRatioPreset.square,
          // CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          // CropAspectRatioPreset.ratio4x3,
          // CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: const AndroidUiSettings(
            toolbarTitle: 'Pangkas',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
      );
      if (croppedFile != null) {
        Get.to(() => DisplayPictureScreen(imagePath: croppedFile.path));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RotationTransition(
              turns: const AlwaysStoppedAnimation(90 / 360),
              child: FloatingActionButton(
                backgroundColor: Colors.blue,
                heroTag: 'pick image gallery',
                onPressed: () => pickImageGallery(),
                child: const Icon(MdiIcons.image),
              ),
            ),
            const SizedBox(width: 10),
            RotationTransition(
              turns: const AlwaysStoppedAnimation(90 / 360),
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                heroTag: 'capture',
                onPressed: () => _capture(),
                child: const Icon(
                  MdiIcons.camera,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),

      // controller!.setFlashMode(FlashMode.off);
      body: (!controller!.value.isInitialized)
          ? Container()
          : CameraPreview(controller!),
    );
  }
}
