import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:innovins/core/widgets/snackbar_widget.dart';
import 'package:innovins/data/model/getAllProduct_response.dart';
import 'package:innovins/module/product_list/widget/edit_product_widget.dart';
import 'package:innovins/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductListController extends GetxController{




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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token  = prefs.getString('user_login_token')!;
    isLoading.value = true;
    try {
      var response = await ApiService().editProduct(token,editId.value,productNameController.text,priceController.text,moqController.text,discountController.text);
      if(response!.title=='Success!'){
        addProductLoading.value=false;
        Get.back();
        CustomSnackBar.showSuccessSnackBar('Update','Product update Successful');
        getAllProducts();
      }else{
        addProductLoading.value=false;
      }
    }catch(e){
      if (kDebugMode) {
        print(e);
      }
    }
  }

  deleteProduct(id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token  = prefs.getString('user_login_token')!;
    try{
      var response = await ApiService().deleteProduct(token,id);
      if(response!.title=='Success!'){
        addProductLoading.value=false;
        CustomSnackBar.showSuccessSnackBar('Delete','Product Delete Successful');

        getAllProducts();
      }else{
        addProductLoading.value=false;
      }
    }catch(e){
      if (kDebugMode) {
        print(e);
      }
    }

  }
}