import 'package:get/get.dart';
import 'package:innovins/data/repository/home/home_repo_impl.dart';
import 'package:innovins/module/dashboard/controller/dashboard_controller.dart';
import 'package:innovins/module/home_page/home_page_controller.dart';
class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<ProductCartController>(() => ProductCartController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    //Get.lazyPut<ProductDetailController>(() => ProductDetailController());
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut<HomeRepoImpl>(() => HomeRepoImpl());
  }
}
