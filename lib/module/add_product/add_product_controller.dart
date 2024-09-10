import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:innovins/core/theme/app_color.dart';
import 'package:innovins/core/theme/app_font_weight.dart';
import 'package:innovins/data/repository/add_product/add_product_repo.dart';
import 'package:innovins/data/repository/add_product/add_product_repo_impl.dart';
import 'package:innovins/routes/app_pages.dart';


class AddProductController extends GetxController{

  late AddProductRepo _addProductRepo;

  AddProductController() {
    _addProductRepo = Get.put(AddProductRepoImpl());
  }
  final GlobalKey<FormState> appProductFormKey = GlobalKey<FormState>();
  RxBool addProductLoading = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController productNameController = TextEditingController();
  final TextEditingController mpqController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountPriceController = TextEditingController();

  @override
  void dispose() {
    productNameController.dispose();
    mpqController.dispose();
    priceController.dispose();
    discountPriceController.dispose();
    super.dispose();
  }

  RxBool isSigningUp = false.obs;

  addProduct() async {
    addProductLoading.value=true;
    try{
      final response = await _addProductRepo.addProductAPI(productNameController.text,mpqController.text,priceController.text,discountPriceController.text);

      if(response!.title=='Success!'){
        addProductLoading.value=false;

        Get.snackbar(
          "Success",
          "Add products",
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

        Future.delayed(const Duration(seconds: 1));
        Get.offAllNamed(Routes.dashBoardScreen);


      }else{
        addProductLoading.value=false;
      }
    }catch(e){}

  }

  Widget textWidget(String? title){
    return Text(title!,style: GoogleFonts.nunitoSans(
        color: Colors.black54,
        fontSize: Get.width*0.045,fontWeight: AppFontWeight.fontSemiBold),);
  }
}