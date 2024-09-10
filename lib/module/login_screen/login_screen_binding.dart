import 'package:get/get.dart';
import 'package:innovins/data/repository/login/login_repo_impl.dart';


import 'login_screen_controller.dart';

class LoginScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>LoginRepoImpl());
    Get.lazyPut(() => LoginScreenController());
  }

}