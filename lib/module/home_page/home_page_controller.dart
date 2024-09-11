import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovins/core/widgets/snackbar_widget.dart';
import 'package:innovins/data/model/getAllProduct_response.dart';
import 'package:innovins/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageController extends GetxController {


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



  void getAllProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token  = prefs.getString('user_login_token')!;
    isLoading.value = true;
    try {

      var response = await ApiService().productList(token);

      if(response!=null ){
        isLoading.value = false;
        getProductList.value = response;
        getProductFilterList.value = response;
      }else{
        isLoading.value = false;
        getProductList.clear();
        getProductFilterList.clear();
      }
    } catch (e) {
      isLoading.value = false;
      getProductList.clear();
      getProductFilterList.clear();
      Navigator.of(Get.context!).pop();
      CustomSnackBar.showFailedSnackBar('Failed','Failed');
    }
  }


  }
