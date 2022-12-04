import 'package:get/get.dart';
import 'package:getxis_redemption/user_model.dart';

class UserController extends GetxController {
  Rx<UserModel> user = UserModel().obs;

  void setUserName(String userName){
    /* user.update((val) {
      val!.name = userName;
    }); */
    user.value.name = userName; // both methods works.
    user.refresh();
  }

  void setUserAge(int userAge){
    user.update((val) {
      val!.age = userAge;
    });
  }
}