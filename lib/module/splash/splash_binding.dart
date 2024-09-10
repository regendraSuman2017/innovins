import 'package:get/get.dart';
import 'package:innovins/module/splash/splash_controller.dart';
class SplashBinding extends Bindings {
  @override
  void dependencies() {
//    Get.lazyPut(()=>HomeRepoImpl());
    Get.put(SplashController());
  }
}
