import 'package:innovins/data/model/getAllProduct_response.dart';

abstract class HomeRepo{
  Future<List<GetAllProductResponse>?> getAllProductsAPI();

}