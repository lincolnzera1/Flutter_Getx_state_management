import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxis_redemption/value_controller.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final valueController = ValueController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GetBuilder<ValueController>(
            init: valueController, // injeção de dependência
            initState: (_) {},
            builder: (_) {
              return Text("Valor definido: ${valueController.frase}");
            },
          ),
          TextField(
            controller: valueController.textController,
          ),
          GetBuilder<ValueController>(
              init: valueController,
              builder: (_) {
                return valueController.isLoad
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          String value = valueController.textController.text;
                          valueController.setValue(value);
                        },
                        child: const Text("Confirmar"));
              })
        ],
      ),
    );
  }
}
