import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifi/DataModel.dart';
import 'package:notifi/Screens/Added.dart';

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
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return AddedScreen(
                    model: item[index],
                  );
                })));
              },
              child: ListTile(
                leading: CircleAvatar(
                  radius: 26,
                  backgroundImage: FileImage(item[index].image),
                ),
                title: Text(item[index].place),
              ),
            );
          });
    }
  }
}
