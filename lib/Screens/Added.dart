import 'package:flutter/material.dart';
import 'package:notifi/DataModel.dart';

class AddedScreen extends StatelessWidget {
  const AddedScreen({super.key, required this.model});
  final ModelData model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.place),
      ),
      body: Center(
        child: Text(model.place),
      ),
    );
  }
}
