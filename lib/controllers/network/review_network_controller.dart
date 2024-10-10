import 'dart:convert';

import 'package:get/get.dart';
import 'package:hotel_manager_app/constants/network_constants.dart';
import 'package:hotel_manager_app/exception/list_pass_exception.dart';
import 'package:hotel_manager_app/exception/network_exception.dart';
import 'package:http/http.dart' as http;

class ReviewNetworkController extends GetxController {
  static ReviewNetworkController instance = Get.find();

  Future<List<Map<String, dynamic>>> getTempReviewList() async {
    List<Map<String, dynamic>> reviewList = [];

    Uri url = Uri.parse('${NetworkConstants.baseUrl}/review/temp/all');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        var jsonResponse = jsonDecode(response.body) as List;
        reviewList = jsonResponse
            .map((reservation) => reservation as Map<String, dynamic>)
            .toList();
        print('###length of pending reviewList:${reviewList.length}');
        return reviewList;
      } catch (e) {
        print(e);
        throw ListPassException(message: 'json decode error in getReviewList');
      }
    } else {
      print('get review Request failed with status: ${response.statusCode}.');
      throw NetworkException();
    }
  }

  Future<List<Map<String, dynamic>>> getApprovedReviewList() async {
    List<Map<String, dynamic>> reviewList = [];

    Uri url = Uri.parse('${NetworkConstants.baseUrl}/review/all');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        var jsonResponse = jsonDecode(response.body) as List;
        reviewList = jsonResponse
            .map((reservation) => reservation as Map<String, dynamic>)
            .toList();
        print('###length of approved reviewList:${reviewList.length}');
        return reviewList;
      } catch (e) {
        print(e);
        throw ListPassException(message: 'json decode error in getReviewList');
      }
    } else {
      print('get review Request failed with status: ${response.statusCode}.');
      throw NetworkException();
    }
  }

  Future<Map<String, dynamic>> approveReview(int reviewId) async {
    try {
      Uri url = Uri.parse(
          '${NetworkConstants.baseUrl}/review/temp/approve?tempReviewId=$reviewId');
      var response = await http.post(url);

      if (response.statusCode == 200) {
        try {
          Map<String, dynamic> reviewMap =
              jsonDecode(response.body) as Map<String, dynamic>;
          return reviewMap;
        } catch (e) {
          throw ListPassException(message: 'Error in parsing approved review');
        }
      } else {
        print('Error occurs approve review with : ${response.statusCode}');
        throw NetworkException();
      }
    } catch (e) {
      throw NetworkException(message: 'Error occurs approve review');
    }
  }

  Future<void> removeReview(int id)async{
    try{
      Uri url = Uri.parse('${NetworkConstants.baseUrl}/review/temp/delete?tempReviewId=$id');
      var response = await http.delete(url);

      if(response.statusCode != 204){
        print('Error occurs remove review with : ${response.statusCode}');
      }
    }catch(e){
      print('Error occurs deleting review');
      print(e.toString());
    }
  }
}
