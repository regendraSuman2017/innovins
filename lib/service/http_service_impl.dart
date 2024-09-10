import 'dart:async';
import 'package:dio/dio.dart';
import 'package:innovins/core/url_constant.dart';
import 'package:innovins/service/http_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpServiceImpl implements HttpService {
  Dio?  _dio;


  @override
  Future<void> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token  = prefs.getString('user_login_token')??'';

    _dio = Dio(BaseOptions(baseUrl: UrlConstant.baseUrl));
    _dio!.options.headers["Authorization"] = "Bearer $token";
    _dio!.options.headers['Content-Type'] = 'application/json';
  }

  @override
  Future<Response> signupRequest(String name,String email,String mobile,String password) async {
    Response response;
    try {
      FormData formData = FormData.fromMap({
        'name': name,
        'email': email,
        "mobile": mobile,
        "password": password
      });



      response = await _dio!.post(UrlConstant.signUp, data: formData);
      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }


  @override
  Future<Response> getAllProductsRequest() async {
    Response response;
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String token  = prefs.getString('user_login_token')??'';
print("sdfsdf ${token}");
      FormData formData = FormData.fromMap({
        'user_login_token': token,
      });

      response = await _dio!.post(UrlConstant.productList, data: formData);
      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
/*

  @override
  Future<Response> getSelectProductsRequest(int id) async {
    Response response;
    try {
      response = await _dio.get('${UrlConstant.signUp}/$id');

    } on DioException catch (e) {
      throw Exception(e.message);
    }
    return response;
  }
*/

  @override
  Future<Response> loginRequest(String phoneNumber, String password)async{
    Response response;
    try {
      FormData formData = FormData.fromMap({
        'email': phoneNumber,
        "password": password
      });
      response = await _dio!.post(UrlConstant.login, data: formData);
      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<Response> addProductRequest(String? productName, String? moq, String? price, String? discount) async {
    Response response;
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String token  = prefs.getString('user_login_token')??'';


      FormData formData = FormData.fromMap({
        'user_login_token':token,
        'name':productName,
        'moq':moq,
        'price':price,
        'discounted_price':discount,
      });

      response = await _dio!.post(UrlConstant.addProduct, data: formData);

      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<Response> deleteProductRequest(id) async {
    Response response;
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String token  = prefs.getString('user_login_token')??'';


      FormData formData = FormData.fromMap({
        'user_login_token':token,
        'id':id
      });

      response = await _dio!.post(UrlConstant.deleteProduct, data: formData);

      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<Response> editProductRequest(id,name,price,moq,discount) async {
    Response response;
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String token  = prefs.getString('user_login_token')??'';

      FormData formData = FormData.fromMap({
        'user_login_token':token,
        'id':id,
        'name':name,
        'moq':moq,
        'price':price,
        'discounted_price':discount
      });

      response = await _dio!.post(UrlConstant.editProduct, data: formData);

      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

}
