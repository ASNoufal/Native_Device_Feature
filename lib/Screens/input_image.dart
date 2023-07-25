import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InputImage extends StatefulWidget {
  const InputImage({super.key, required this.onphotokey});

  final void Function(File photo) onphotokey;

  @override
  State<InputImage> createState() => _InputImageState();
}

class _InputImageState extends State<InputImage> {
  File? currantimages;
  void _opencamera() async {
    final imagepicker = ImagePicker();
    final pickedimage = await imagepicker.pickImage(source: ImageSource.camera);
    if (pickedimage == null) {
      return;
    }
    setState(() {
      currantimages = File(pickedimage.path);
    });

    widget.onphotokey(currantimages!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
        onPressed: _opencamera,
        icon: const Icon(Icons.camera),
        label: const Text("open camera"));

    if (currantimages != null) {
      content = GestureDetector(
        onTap: _opencamera,
        child: Image.file(
          currantimages!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }
    return Container(
        height: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: Theme.of(context).colorScheme.primary)),
        child: content);
  }
}
