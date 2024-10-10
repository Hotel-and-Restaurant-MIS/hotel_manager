import 'package:get/get.dart';
import 'package:hotel_manager_app/controllers/data/review_data_controller.dart';
import 'package:hotel_manager_app/models/review.dart';

class ReviewDetailsStateController extends GetxController{
  static ReviewDetailsStateController instance = Get.find();

  ReviewDataController _rdc = ReviewDataController.instance;

  RxBool _isCalling = false.obs;
  bool get isCalling => _isCalling.value;
  void setIsCalling(bool value){
    _isCalling.value = value;
  }


  Future<void> approveReview(int reviewId) async{
    setIsCalling(true);
    await _rdc.approveReview(reviewId);
    setIsCalling(false);
  }

  Future<void> removeReview(int reviewId) async{
    setIsCalling(true);
    await _rdc.removeReview(reviewId);
    setIsCalling(false);
  }
}