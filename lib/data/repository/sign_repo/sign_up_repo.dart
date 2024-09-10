import 'package:innovins/data/model/sign_up_response.dart';

abstract class SignUpRepo{
  Future<SignUpResponse?>signUpAPI(String name,String email,String mobile,String password);
}