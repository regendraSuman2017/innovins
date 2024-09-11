import 'package:get/get.dart';
import 'package:innovins/core/localdatabase/product_cart_list.dart';

class ProductCartController extends GetxController {

  RxBool isLoading = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProduct();
  }

  @override
  onReady(){
    super.onReady();
    getProduct();
  }

  RxList<ProductCartListOffline> productList = <ProductCartListOffline>[].obs;

  getProduct() async {
    isLoading.value=true;
    ProductCartListOffline getProducts = ProductCartListOffline.empty();
    productList.value = await getProducts.getProduct();
    isLoading.value=false;

    // Sum the price of all products in the list, converting String to double safely
    double totalPrice = productList.fold(0.0, (sum, product) {
      // Try to parse the price if it's a string, fallback to 0.0 if it fails
      double price = 0.0;
      if (product.price is String) {
        price = double.tryParse(product.price!) ?? 0.0;  // Parse String to double
      } else if (product.price is num) {
        price = double.parse(product.price.toString());  // If it's already a number, just convert to double
      }

      return sum + price;
    });

    totalPriceNew.value = totalPrice;

  }

  deleteItem(int id) async {
    ProductCartListOffline deleteP = ProductCartListOffline();
    await deleteP.delete(id);
    getProduct();
  }

  var isInCart = false.obs;
  var isInWishList = false.obs;
  RxDouble totalPriceNew = 0.0.obs;


}