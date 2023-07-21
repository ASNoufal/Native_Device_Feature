import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifi/DataModel.dart';
import 'package:notifi/Screens/Yourplace.dart';

class TextproviderNotifier extends StateNotifier<List<ModelData>> {
  TextproviderNotifier() : super(const []);

  void additems(String title) {
    final items = ModelData(place: title);
    state = [...state, items];
  }
}

final textprovider =
    StateNotifierProvider<TextproviderNotifier, List<ModelData>>(
        (ref) => TextproviderNotifier());
