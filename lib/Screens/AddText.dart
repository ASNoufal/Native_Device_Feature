import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifi/Screens/input_image.dart';
import 'package:notifi/provider/textprovider.dart';

class AddTextScreen extends ConsumerStatefulWidget {
  const AddTextScreen({super.key});

  @override
  ConsumerState<AddTextScreen> createState() => _AddTextScreenState();
}

class _AddTextScreenState extends ConsumerState<AddTextScreen> {
  final TextEditingController textEditingController = TextEditingController();

  File? currentImage;

  void goback() {
    final typevalue = textEditingController.text.trim();

    if (typevalue.isEmpty || currentImage == null) {
      return;
    }

    ref.read(textprovider.notifier).additems(typevalue, currentImage!);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new place"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: textEditingController,
              decoration: const InputDecoration(
                  labelText: "title", border: OutlineInputBorder()),
            ),
          ),
          InputImage(onphotokey: (photo) {
            currentImage = photo;
          }),
          ElevatedButton.icon(
              icon: const Icon(Icons.add),
              onPressed: goback,
              label: const Text("Add Item"))
        ],
      ),
    );
  }
}
