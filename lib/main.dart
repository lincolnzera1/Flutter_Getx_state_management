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
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () {
                return Column(
                  children: [
                    Text("Nome: ${valueController.frase}"),
                    Text("Idade: ${valueController.frase}")
                  ],
                );
              },
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(label: Text("Nome")),
                    controller: valueController.nomeController,
                  ),
                ),
                SizedBox(width: 90,),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {}, child: Text("Salvar"))),
              ],
            ),
            Row(              
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(label: Text("Idade")),
                    controller: valueController.idadeController,
                  ),
                ),
                SizedBox(width: 90,),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {}, child: Text("Salvar"))),
              ],
            ),
            SizedBox(height: 50,),
            Obx(() {
              return valueController.isLoad.value
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
      ),
    );
  }
}
