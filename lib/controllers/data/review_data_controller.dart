import 'package:get/get.dart';
import 'package:hotel_manager_app/constants/review_constants.dart';
import 'package:hotel_manager_app/controllers/network/review_network_controller.dart';
import 'package:hotel_manager_app/models/review.dart';


class ReviewDataController extends GetxController{

  static ReviewDataController instance = Get.find();

  ReviewNetworkController _rnc = ReviewNetworkController.instance;

  RxMap<String, List<Review>> _reviewDataMap = <String, List<Review>>{}.obs;

  Map<String, List<Review>> get reviewDataMap => _reviewDataMap.value;


  RxBool _isGettingReviews = false.obs;

  bool get isGettingReviews => _isGettingReviews.value;
  void setIsGettingReviews(bool value){
    _isGettingReviews.value = value;
  }

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await _initController();
  }

  Future<void>_initController() async{
    await _getAllReviews();
  }

  Future<void>_getAllReviews() async{
    try{
      setIsGettingReviews(true);
      List<Review> reviewList =[];
      List<Map<String,dynamic>> tempReviewListMap = await _rnc.getTempReviewList();
      List<Map<String,dynamic>> approvedReviewListMap = await _rnc.getApprovedReviewList();

      tempReviewListMap.forEach((Map<String,dynamic> tempReviewMap){
        reviewList.add(Review.fromMap(tempReviewMap));
      });
      approvedReviewListMap.forEach((Map<String,dynamic> approvedReviewMap){
        reviewList.add(Review.fromMap(approvedReviewMap));
      });

      kReviewNames.forEach((status)=> _reviewDataMap[status] =[]);
      reviewList.forEach((review){
        if(_reviewDataMap.containsKey(review.reviewStatus)){
          _reviewDataMap[review.reviewStatus]!.add(review);
        }
      });
      setIsGettingReviews(false);
    }catch(e){
      print('Error getting All Reviews');
      print(e.toString());
    }

  }

 Future<void> approveReview(int reviewId) async{
    try{
      Map<String, dynamic> reviewMap = await _rnc.approveReview(reviewId);
      _reviewDataMap['Approved']?.add(Review.fromMap(reviewMap));
      _reviewDataMap['Pending']?.removeWhere((review)=> review.reviewId == reviewId);
    }catch(e){
      print('Error occurs approving review');
      print(e.toString());
    }
 }

  Future<void> removeReview(int reviewId) async{
    try{
      await _rnc.removeReview(reviewId);
      _reviewDataMap['Pending']?.removeWhere((review)=> review.reviewId == reviewId);
    }catch(e){
      print('Error occurs removing review');
      print(e.toString());
    }

  }
}