import 'package:uuid/uuid.dart';

const uuid = Uuid();

class ModelData {
  ModelData({required this.place}) : id = uuid.v4();
  String place;
  String id;
}
