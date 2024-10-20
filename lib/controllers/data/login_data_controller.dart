import 'package:get/get.dart';
import 'package:hotel_manager_app/controllers/network/login_network_controller.dart';

class LoginDataController extends GetxController{

  static LoginDataController instance = Get.find();

  LoginNetworkController _lnc = LoginNetworkController.instance;

  RxBool _isValidUser =false.obs;

  bool get isValidUser => _isValidUser.value;

  void setIsValidUser(bool value) {
    _isValidUser.value = value;
  }

  Future<void> CheckUser(String password,String userName) async{
    setIsValidUser(await _lnc.authUser(password,userName));
  }

}