import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class ModelData {
  ModelData({required this.place, required this.image}) : id = uuid.v4();
  String place;
  String id;
  File image;
}
