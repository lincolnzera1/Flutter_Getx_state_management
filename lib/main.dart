import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxis_redemption/tela2.dart';
import 'package:getxis_redemption/user_controller.dart';

void main() {
  Get.lazyPut<UserController>(
    () => UserController(),
  );

  runApp(GetMaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final UserController userController = Get.find();
  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Column(
                children: [
                  Text("Nome: ${userController.user.value.name}"),
                  Text("Nome: ${userController.user.value.age}")
                ],
              );
            }),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(label: Text("Nome")),
                    controller: nomeController,
                  ),
                ),
                const SizedBox(
                  width: 90,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          userController.setUserName(nomeController.text);
                        },
                        child: Text("Salvar"))),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(label: Text("Idade")),
                    controller: idadeController,
                  ),
                ),
                SizedBox(
                  width: 90,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          userController
                              .setUserAge(int.parse(idadeController.text));
                        },
                        child: Text("Salvar"))),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => Tela2());
                },
                child: Text("Run"))
          ],
        ),
      ),
    );
  }
}

class Tela2 extends StatelessWidget {
  Tela2({super.key});

  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Obx(() {
              return Text("texto: ${userController.user.value.name}");
            })
          ],
        ),
      ),
    );
  }
}
