import 'dart:math';

import 'package:flutter/material.dart';
import 'package:local_storage/models/number_model.dart';
import 'package:local_storage/screens/controllers/numbers_storage_controller.dart';

class NumbersController {
  final NumberStorageController _storageController;

  NumbersController(this._storageController);

  final ValueNotifier<List<NumberModel>> numbers = ValueNotifier([]);

  void addRandomNumber() {
    numbers.value = [
      ...numbers.value,
      NumberModel(
        Random().nextInt(100),
      )
    ];
  }

  Future<void> saveNumbersList(BuildContext context) async {
    await _storageController.saveNumberList(numbers.value);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Números aleatórios salvos com sucesso!')));
    }
  }

  Future<void> loadList() async {
    numbers.value = await _storageController.loadNumbersList();
  }

  Future<void> clearNumbersList(BuildContext context) async {
    await _storageController.clearNumbersList();

    numbers.value = [];

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Números aleatórios limpos com sucesso")));
    }
  }
}
