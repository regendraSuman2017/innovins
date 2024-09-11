import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:innovins/data/model/add_product.dart';
import 'package:innovins/data/model/getAllProduct_response.dart';
import 'package:innovins/data/model/login_response.dart';
import 'package:innovins/data/model/sign_up_response.dart';

class ApiService {
  final String baseUrl = 'https://shareittofriends.com/demo/flutter';

  // Register API
  Future<SignUpResponse?> register(String name, String email, String mobile, String password) async {
    var url = Uri.parse('$baseUrl/Register.php');
    var response = await http.post(
      url,
      body: {
        'name': name,
        'email': email,
        'mobile': mobile,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> responseMap = Map.from(jsonDecode(response.body.toString()));
      return SignUpResponse.fromJson(responseMap);
    } else {
      if (kDebugMode) {
        print('Error: ${response.statusCode}');
      }
      return null;
    }
  }

  // Login API
  Future<LoginResponse?> login(String email, String password) async {
    var url = Uri.parse('$baseUrl/Login.php');
    var response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> responseMap = Map.from(jsonDecode(response.body.toString()));
      return LoginResponse.fromJson(responseMap);
    } else {
      if (kDebugMode) {
        print('Error: ${response.statusCode}');
      }
      return null;
    }
  }


  // Product List API
  Future<List<GetAllProductResponse>?> productList(String token) async {
    var url = Uri.parse('$baseUrl/productList.php');
    var response = await http.post(
      url,
      body: {
        'user_login_token': token,
      },
    );
    if (response.statusCode == 200) {
      // Decode the JSON response
      List<dynamic> responseBody = json.decode(response.body);

      // Map JSON response to List<GetAllProductResponse>
      List<GetAllProductResponse> products = responseBody
          .map((json) => GetAllProductResponse.fromJson(json))
          .toList();

      return products;
    } else {
      if (kDebugMode) {
        print('Error: ${response.statusCode}');
      }
      return null;
    }
  }

  // Add Product API
  Future<AddProductResponse?> addProduct(String token, String name, String moq, String price, String discountedPrice) async {
    var url = Uri.parse('$baseUrl/addProduct.php');
    var response = await http.post(
      url,
      body: {
        'user_login_token': token,
        'name': name,
        'moq': moq,
        'price': price,
        'discounted_price': discountedPrice,
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> responseMap = Map.from(jsonDecode(response.body.toString()));
      return AddProductResponse.fromJson(responseMap);
    } else {
      if (kDebugMode) {
        print('Error: ${response.statusCode}');
      }
      return null;
    }
  }

  // Edit Product API
  Future<AddProductResponse?> editProduct(String token, String id, String name, String moq, String price, String discountedPrice) async {
    var url = Uri.parse('$baseUrl/editProduct.php');
    var response = await http.post(
      url,
      body: {
        'user_login_token': token,
        'id': id,
        'name': name,
        'moq': moq,
        'price': price,
        'discounted_price': discountedPrice,
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> responseMap = Map.from(jsonDecode(response.body.toString()));
      return AddProductResponse.fromJson(responseMap);
    } else {
      if (kDebugMode) {
        print('Error: ${response.statusCode}');
      }
      return null;
    }
  }

  // Delete Product API
  Future<AddProductResponse?> deleteProduct(String token, String id) async {
    var url = Uri.parse('$baseUrl/deleteProduct.php');
    var response = await http.post(
      url,
      body: {
        'user_login_token': token,
        'id': id,
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> responseMap = Map.from(jsonDecode(response.body.toString()));
      return AddProductResponse.fromJson(responseMap);
    } else {
      if (kDebugMode) {
        print('Error: ${response.statusCode}');
      }
      return null;
    }
  }
}
