import 'dart:convert';

import 'package:get/get.dart';
import 'package:hotel_manager_app/constants/network_constants.dart';
import 'package:hotel_manager_app/exception/list_pass_exception.dart';
import 'package:hotel_manager_app/exception/network_exception.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


class  AvailableRoomsNetworkController extends GetxController{
  static AvailableRoomsNetworkController instance = Get.find();

  Future<List<Map<String, dynamic>>> getAvailableRoomCount(
      {required List<DateTime> dateList}) async {
    try {
      List<Map<String, dynamic>> currentRoomCountList = [];

      Uri url = Uri.parse(
          '${NetworkConstants.baseUrl}/bookings/totalAvailableRoomCount?from=${DateFormat('yyyy-MM-dd').format(dateList[0])}&to=${DateFormat('yyyy-MM-dd').format(dateList[1])}');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        try {
          var jsonResponse = jsonDecode(response.body) as List;
          currentRoomCountList = jsonResponse
              .map((roomType) => roomType as Map<String, dynamic>)
              .toList();
          return currentRoomCountList;

        } catch (e) {
          throw ListPassException(
              message: 'List Passing error at getting available room count');
        }
      } else {
        throw NetworkException(
            message:
            'Network Error due to : Status ${response.statusCode}, ${response.body}');
      }
    } catch (e) {
      print('Error getting/parsing available room count data');
      print(e.toString());
      throw NetworkException(message: e.toString());
    }
  }

}