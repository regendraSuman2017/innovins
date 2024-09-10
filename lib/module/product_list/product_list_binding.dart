import 'package:get/get.dart';
import 'package:innovins/data/repository/add_product/add_product_repo_impl.dart';
import 'package:innovins/module/product_cart_page/product_cart_controller.dart';
import 'package:innovins/module/product_list/product_list_controller.dart';

class ProductListBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(()=>ProductListController());
    Get.lazyPut(()=>AddProductRepoImpl());
    Get.lazyPut(()=>ProductCartController());

  }
}