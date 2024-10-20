import 'package:get/get.dart';

class LoginNetworkController extends GetxController{
  static LoginNetworkController instance = Get.find();

  Future<bool> authUser(String password,String userName)async{
    return (password == '1234' && userName == 'Ashen')?true:false;
  }
}