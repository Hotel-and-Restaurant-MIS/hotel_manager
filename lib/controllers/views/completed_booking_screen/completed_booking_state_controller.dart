import 'package:get/get.dart';

class CompletedBookingStateController extends GetxController{
  static CompletedBookingStateController instance = Get.find();

  RxBool _isVisible = false.obs;

  bool get isVisible => _isVisible.value;

  void setIsVisible(bool value) {
    _isVisible.value = value;
  }
  void changeVisibility(){
    print(isVisible);
    print('button pressed');
    setIsVisible(!isVisible!);
  }
}
