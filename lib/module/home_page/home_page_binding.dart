import 'package:get/get.dart';
import 'package:innovins/data/repository/home/home_repo_impl.dart';
import 'package:innovins/module/home_page/home_page_controller.dart';

class HomePageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>HomeRepoImpl());
Get.put(HomePageController());
  }
}
