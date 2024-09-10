import 'package:get/get.dart';
import 'package:innovins/data/repository/home/home_repo_impl.dart';
import 'package:innovins/module/product_detail_page/product_detail_controller.dart';

class ProductDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>HomeRepoImpl());
Get.put(ProductDetailController());
  }
}
