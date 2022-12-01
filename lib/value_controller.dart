import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ValueController extends GetxController {
  TextEditingController textController = TextEditingController();
  RxString frase = "".obs;
  bool isLoad = false;

  Future<void> setValue(String newValue) async {
    isLoad = true;
    update();
    await Future.delayed(const Duration(seconds: 2));

    isLoad = false;
    frase.value = newValue;
    update();
  }
}
