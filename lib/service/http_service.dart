import 'package:dio/dio.dart';

abstract class HttpService {
  void init();

  Future<Response> signupRequest(String name,String email,String mobile,String password);
  Future<Response> getAllProductsRequest();
  Future<Response> addProductRequest(String? productName,String? moq,String? price,String? discount);
  Future<Response> loginRequest(String phoneNumber, String password);
  Future<Response> deleteProductRequest(id);
  Future<Response> editProductRequest(id,name,price,moq,discount);

}
