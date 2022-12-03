import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ValueController extends GetxController {
  TextEditingController textController = TextEditingController();
  TextEditingController nomeController= TextEditingController();
  TextEditingController idadeController = TextEditingController();
  RxString frase = "".obs;
  RxBool isLoad = false.obs;

  Future<void> setValue(String newValue) async {
    isLoad.value = true;
    await Future.delayed(const Duration(seconds: 2));

    isLoad.value = false;
    frase.value = newValue;
  }
}
