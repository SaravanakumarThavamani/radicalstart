import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'custombutton.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({super.key});

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? _selectedImage;
  final _imagePicker = ImagePicker();

  void uploadImage(bool isCamera) async {
    XFile? image;
    if (isCamera) {
      Permission cameraStatus = Permission.camera;
      if (await cameraStatus.isGranted) {
        image = await _imagePicker.pickImage(source: ImageSource.camera);
      } else {
        final status = await Permission.camera.request();
        if (status.isGranted) {
          image = await _imagePicker.pickImage(source: ImageSource.camera);
        }
      }
    } else {
      Permission galleryStatus = Permission.storage;
      if (await galleryStatus.isGranted) {
        image = await _imagePicker.pickImage(source: ImageSource.gallery);
      } else {
        final status = await Permission.storage.request();
        if (status.isGranted) {
          image = await _imagePicker.pickImage(source: ImageSource.gallery);
        }
      }
    }
    if (image != null) {
      setState(() {
        _selectedImage = File(image!.path);
      });
    }
    Navigator.pop(context);
  }

  void chooseOption() {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    showModalBottomSheet(
      backgroundColor: isDark
          ? const Color.fromARGB(255, 234, 234, 234)
          : const Color.fromARGB(255, 234, 234, 234),
      context: context,
      builder: (ctx) {
        return Container(
          padding: const EdgeInsets.only(left: 20, top: 20),
          height: 250,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upload via',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              CustomLabelButton(
                label: 'Camera',
                onTap: () {
                  uploadImage(true);
                },
                iconData: Icons.camera_alt,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              CustomLabelButton(
                label: 'Gallery',
                onTap: () {
                  uploadImage(false);
                },
                iconData: Icons.image,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Upload Image',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 320,
                  height: 280,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(46, 142, 142, 142),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: _selectedImage == null
                      ? Center(
                          child: IconButton.filled(
                            icon: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                            padding: const EdgeInsets.all(12),
                            onPressed: chooseOption,
                          ),
                        )
                      : Image.file(
                          _selectedImage!,
                          fit: BoxFit.cover,
                        ),
                ),
                const SizedBox(
                  height: 30,
                ),
                if (_selectedImage != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton.filled(
                        onPressed: chooseOption,
                        padding: const EdgeInsets.all(12),
                        icon: const Icon(
                          Icons.edit,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      IconButton.filled(
                        onPressed: () {},
                        padding: const EdgeInsets.all(12),
                        icon: const Icon(
                          Icons.check,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
