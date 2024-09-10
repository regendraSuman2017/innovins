import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovins/data/model/getAllProduct_response.dart';
import 'package:innovins/data/repository/home/home_repo.dart';
import 'package:innovins/data/repository/home/home_repo_impl.dart';

class HomePageController extends GetxController {
  late HomeRepo _homeRepo;

  HomePageController() {
    _homeRepo = Get.find<HomeRepoImpl>();
  }

  RxList<GetAllProductResponse> getProductList = <GetAllProductResponse>[].obs;
  RxList<GetAllProductResponse> getProductFilterList = <GetAllProductResponse>[].obs;

  TextEditingController searchText = TextEditingController();


  RxBool isLoading = false.obs;
  RxBool addProductLoading = false.obs;




  ///Add Product


  TextEditingController productNameController = TextEditingController();
  TextEditingController moqController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    getAllProducts();

  }

  @override
  void dispose() {
    super.dispose();
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







  }
