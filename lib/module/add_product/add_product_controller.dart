import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:innovins/core/theme/app_font_weight.dart';
import 'package:innovins/core/widgets/snackbar_widget.dart';
import 'package:innovins/routes/app_pages.dart';
import 'package:innovins/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AddProductController extends GetxController{


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
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token  = prefs.getString('user_login_token')!;
      final response = await ApiService().addProduct(token,productNameController.text,mpqController.text,priceController.text,discountPriceController.text);
      if(response!.title=='Success!'){
        addProductLoading.value=false;
        CustomSnackBar.showSuccessSnackBar('Success','Add products');

        Future.delayed(const Duration(seconds: 1));
        Get.offAllNamed(Routes.dashBoardScreen);


      }else{
        addProductLoading.value=false;
      }
    }catch(e){
      if (kDebugMode) {
        print(e);
      }
    }

  }

  Widget textWidget(String? title){
    return Text(title!,style: GoogleFonts.nunitoSans(
        color: Colors.black54,
        fontSize: Get.width*0.045,fontWeight: AppFontWeight.fontSemiBold),);
  }
}