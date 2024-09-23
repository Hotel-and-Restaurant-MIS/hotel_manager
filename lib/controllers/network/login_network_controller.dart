import 'package:get/get.dart';

class LoginNetworkController extends GetxController{
  static LoginNetworkController instance = Get.find();

  Future<bool> authUser(String password)async{
    return password == 'ash'?true:false;
  }
}