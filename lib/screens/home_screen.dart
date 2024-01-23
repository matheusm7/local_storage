import 'package:flutter/material.dart';
import 'package:local_storage/models/number_model.dart';
import 'package:local_storage/screens/controllers/numbers_controller.dart';
import 'package:local_storage/screens/controllers/numbers_storage_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final numbersCtrl = NumbersController(NumberStorageController());

  @override
  void initState() {
    numbersCtrl.loadList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ValueListenableBuilder(
              valueListenable: numbersCtrl.numbers,
              builder: (_, List<NumberModel> numbersList, __) => Expanded(
                child: numbersList.isEmpty
                    ? const Center(
                        child: Text(
                          'Começe gerando um número!',
                          style: TextStyle(fontSize: 24),
                        ),
                      )
                    : ListView(
                        children: numbersList
                            .map(
                              (numberModel) => Text(
                                numberModel.number.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                            .toList(),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: numbersCtrl.addRandomNumber,
                    child: const Text(
                      "GERAR NÚMERO",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () => numbersCtrl.clearNumbersList(context),
                    child: const Text(
                      "LIMPAR LISTA",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () => numbersCtrl.saveNumbersList(context),
                child: const Text(
                  "SALVAR",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
