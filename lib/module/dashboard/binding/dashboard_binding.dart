import 'package:get/get.dart';
import 'package:innovins/module/dashboard/controller/dashboard_controller.dart';
import 'package:innovins/module/home_page/home_page_controller.dart';
import 'package:innovins/module/product_cart_page/product_cart_controller.dart';
class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>ProductCartController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}
