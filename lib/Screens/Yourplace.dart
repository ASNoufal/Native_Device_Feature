import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifi/DataModel.dart';
import 'package:notifi/Screens/AddText.dart';
import 'package:notifi/Screens/place.dart';
import 'package:notifi/provider/textprovider.dart';

class YourPlaceScreen extends ConsumerStatefulWidget {
  const YourPlaceScreen({super.key});

  @override
  ConsumerState<YourPlaceScreen> createState() => _YourPlaceScreenState();
}

class _YourPlaceScreenState extends ConsumerState<YourPlaceScreen> {
  void onnextpage(BuildContext context) {
    Navigator.push((context), MaterialPageRoute(builder: (context) {
      return AddTextScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    final place = ref.watch(textprovider);

    return Scaffold(
        appBar: AppBar(
          title: const Text("YourPlace"),
          actions: [
            IconButton(
                onPressed: () {
                  onnextpage(context);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PlaceScreen(
            item: place,
          ),
        ));
  }
}
