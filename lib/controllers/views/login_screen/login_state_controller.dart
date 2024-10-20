import 'package:get/get.dart';
import 'package:hotel_manager_app/controllers/data/login_data_controller.dart';


class LoginStateController extends GetxController{
  static LoginStateController instance = Get.find();


  LoginDataController _ldc = LoginDataController.instance;

  RxBool isSubmitted = false.obs;
  String? _password;

  String? get password => _password;

  void setPassword(String value) {
    _password = value;
  }

  String? _userName;

  String? get userName => _userName;

  void setUserName(String value) {
    _userName = value;
  }

  Future<void> checkUser()async{

   await _ldc.CheckUser(_password!,_userName!);
   isSubmitted.value = true;
  }

}