import 'package:get/get.dart';

class ProductDetailController extends GetxController {

  RxBool isLoading = false.obs;

  RxString id=''.obs;
  RxString title=''.obs;
  RxString imageUrl=''.obs;
  RxString discount=''.obs;
  RxString price=''.obs;
  RxString moq=''.obs;
  @override

  void onInit() async{
    super.onInit();

    dynamic args = Get.arguments;
    id.value = await args[0];
    title.value= await args[1];
    price.value  = await args[3];

  }




}
