import 'dart:io';

import 'package:e_lenden/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class LogoPicker extends StatefulWidget {
  const LogoPicker({
    Key? key,
  }) : super(key: key);

  @override
  _LogoPickerState createState() => _LogoPickerState();
}

class _LogoPickerState extends State<LogoPicker> {
  File? pickedImage;

  Future<void> pickImage() async {
    try {
      var status = await Permission.photos.request();

      if (status.isGranted) {
        // Permission is granted, proceed with picking the image
        final imagePicker = ImagePicker();
        final image = await imagePicker.pickImage(source: ImageSource.gallery);

        if (image == null) return;

        final tempImage = File(image.path);

        setState(() {
          pickedImage = tempImage;
        });
      } else if (status.isPermanentlyDenied) {
        // The user has permanently denied the permission
        _showSettingsDialog();
      } else {
        // Handle the case where the user denied access
        print('Permission denied');
      }
    } catch (e) {
      // Handle any potential exceptions
      debugPrint(e.toString());
    }
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Permission Required'),
          content: Text(
              'This app needs access to your photo gallery to pick images. Please go to app settings and enable the required permission.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                openAppSettings(); // Open app settings
                Navigator.of(context).pop();
              },
              child: Text('Open Settings'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: KsecondaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: pickedImage == null
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: pickImage,
            icon: Icon(Icons.add_a_photo_outlined),
            color: Colors.black.withOpacity(0.3),
            iconSize: 35.0,
          ),
          Text(
            "Choose logo..",
            style: TextStyle(
              color: Colors.black.withOpacity(0.3),
              fontSize: 16.0,
            ),
          ),
        ],
      )
          : Image.file(pickedImage!),
    );
  }
}
