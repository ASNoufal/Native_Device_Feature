import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifi/DataModel.dart';

class TextproviderNotifier extends StateNotifier<List<ModelData>> {
  TextproviderNotifier() : super(const []);

  void additems(String title, File image) {
    final items = ModelData(place: title, image: image);
    state = [...state, items];
  }
}

final textprovider =
    StateNotifierProvider<TextproviderNotifier, List<ModelData>>(
        (ref) => TextproviderNotifier());
