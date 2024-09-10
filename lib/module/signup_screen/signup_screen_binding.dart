import 'package:get/get.dart';
import 'package:innovins/module/signup_screen/signup_screen_controller.dart';

class SignUpScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpScreenController());
  }

}