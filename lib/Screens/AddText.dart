import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifi/DataModel.dart';
import 'package:notifi/provider/textprovider.dart';

class AddTextScreen extends ConsumerStatefulWidget {
  AddTextScreen({super.key});

  @override
  ConsumerState<AddTextScreen> createState() => _AddTextScreenState();
}

class _AddTextScreenState extends ConsumerState<AddTextScreen> {
  void goback() {
    final data = ref
        .read(textprovider.notifier)
        .additems(textEditingController.text.trim());
    Navigator.of(context).pop();
  }

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(
    BuildContext context,
  ) {
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
          ElevatedButton.icon(
              icon: const Icon(Icons.add),
              onPressed: goback,
              label: const Text("Add Item"))
        ],
      ),
    );
  }
}
