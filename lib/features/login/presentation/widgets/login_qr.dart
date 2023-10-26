import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class LoginQrWidget extends StatefulWidget {
  @override
  _LoginQrWidgetState createState() => _LoginQrWidgetState();
}

class _LoginQrWidgetState extends State<LoginQrWidget> {
  late CameraController _cameraController;
  late List<CameraDescription> cameras;
  int selectedCameraIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    _cameraController =
        CameraController(cameras[selectedCameraIndex], ResolutionPreset.high);
    await _cameraController.initialize();
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  void _takePicture() async {
    if (!_cameraController.value.isTakingPicture) {
      try {
        final XFile picture = await _cameraController.takePicture();
        // You can handle the captured picture here.
      } catch (e) {
        print("Error taking picture: $e");
      }
    }
  }

  void _swapCamera() {
    if (cameras.length > 1) {
      selectedCameraIndex = (selectedCameraIndex + 1) % cameras.length;
      _initializeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraController.value.isInitialized) {
      return CircularProgressIndicator(); // Display a loading indicator.
    }
    return Column(
      children: <Widget>[
        Expanded(
          child: CameraPreview(_cameraController),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: _takePicture,
            ),
            if (cameras.length >
                1) // Only show the switch camera button if there are multiple cameras.
              IconButton(
                icon: Icon(Icons.switch_camera),
                onPressed: _swapCamera,
              ),
          ],
        ),
      ],
    );
  }
}
