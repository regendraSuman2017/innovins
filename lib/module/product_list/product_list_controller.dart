import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:innovins/core/theme/app_color.dart';
import 'package:innovins/data/model/getAllProduct_response.dart';
import 'package:innovins/data/repository/add_product/add_product_repo.dart';
import 'package:innovins/data/repository/add_product/add_product_repo_impl.dart';
import 'package:innovins/data/repository/home/home_repo.dart';
import 'package:innovins/data/repository/home/home_repo_impl.dart';
import 'package:innovins/module/product_list/widget/edit_product_widget.dart';

class ProductListController extends GetxController{


  late AddProductRepo _addProductRepo;
  late HomeRepo _homeRepo;
  ProductListController() {
    _addProductRepo = Get.find<AddProductRepoImpl>();
    _homeRepo = Get.find<HomeRepoImpl>();
  }

  RxBool addProductLoading = false.obs;

  RxString editId = ''.obs;
  RxString editName = ''.obs;

  RxList<GetAllProductResponse> getProductList = <GetAllProductResponse>[].obs;
  RxList<GetAllProductResponse> getProductFilterList = <GetAllProductResponse>[].obs;

  TextEditingController productNameController = TextEditingController();
  TextEditingController moqController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountController = TextEditingController();

  final GlobalKey<FormState> editProductFormKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllProducts();

  }


  Future<void> getAllProducts() async {
    isLoading.value = true;
    try {
      final response = await _homeRepo.getAllProductsAPI();
      print("asldjlkajdl");
      isLoading.value = false;
      if (response != null) {
        getProductList.value = response;
        getProductFilterList.value = response;

      } else {
        getProductList.clear();
        getProductFilterList.clear();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching products: $e');
      }
      getProductList.clear();
      getProductFilterList.clear();
      Get.snackbar(
        "Failed",
        "Failed to fetch products",
        icon: const Icon(Icons.clear, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0x00ffef53),
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    } finally {
      isLoading.value = false;
    }
  }

  editProduct(id,name,price,moq,discountPrice){

    editId.value = id;
    editName.value=name;
    productNameController.text=name;
    priceController.text=price;
    moqController.text=moq;
    discountController.text=discountPrice;

    return Get.defaultDialog(
        radius: 10,
        titleStyle: GoogleFonts.lato(fontWeight: FontWeight.bold),
        titlePadding: EdgeInsets.only(top: Get.height * 0.04),
        title: '',
        content: Container(
            height: Get.height * 0.6,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child:  const EditProductWidget()
        ));
  }

  editProductAPI()async {
    print("Update Product");
    try{
      final response = await _addProductRepo.editProductAPI(editId.value,productNameController.text,priceController.text,moqController.text,discountController.text);

      if(response!.title=='Success!'){
        addProductLoading.value=false;

        Get.back();

        Get.snackbar(
          "Udate",
          "Update products",
          icon: const Icon(Icons.clear, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColor.buttonColor,
          borderRadius: 20,
          margin: const EdgeInsets.all(15),
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );

        getAllProducts();

      }else{
        addProductLoading.value=false;
      }
    }catch(e){}

  }

  deleteProduct(id) async {

    try{
      final response = await _addProductRepo.deleteProductAPI(id);

      if(response!.title=='Success!'){
        addProductLoading.value=false;


        Get.snackbar(
          "Delete",
          "Delete products",
          icon: const Icon(Icons.clear, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColor.buttonColor,
          borderRadius: 20,
          margin: const EdgeInsets.all(15),
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );
        getAllProducts();
      }else{
        addProductLoading.value=false;
      }
    }catch(e){}

  }
}