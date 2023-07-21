import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifi/DataModel.dart';
import 'package:notifi/Screens/Yourplace.dart';
import 'package:notifi/provider/textprovider.dart';

class PlaceScreen extends ConsumerWidget {
  const PlaceScreen({super.key, required this.item});

  final List<ModelData> item;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (item.isEmpty) {
      return const Center(child: Text("No item found"));
    } else {
      return ListView.builder(
          itemCount: item.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(item[index].place),
              ),
            );
          });
    }
  }
}
