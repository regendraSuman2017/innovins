import 'package:get/get.dart';
import 'package:innovins/module/add_product/add_product_controller.dart';

class AddProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddProductController());
  }

}