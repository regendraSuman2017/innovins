import 'package:get/get.dart';
import 'package:innovins/data/repository/add_product/add_product_repo_impl.dart';
import 'package:innovins/module/product_cart_page/product_cart_controller.dart';

class ProductCartBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>AddProductRepoImpl());
Get.put(ProductCartController());
  }
}
