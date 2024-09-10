import 'package:innovins/data/model/add_product.dart';

abstract class AddProductRepo{
  Future<AddProductResponse?> addProductAPI(String? productName,String? moq,String? price,String? discount);
  Future<AddProductResponse?> deleteProductAPI(id);
  Future<AddProductResponse?> editProductAPI(id,name,price,moq,discount);

}