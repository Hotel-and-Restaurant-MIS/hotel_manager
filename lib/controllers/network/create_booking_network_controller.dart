import 'dart:convert';

import 'package:get/get.dart';
import 'package:hotel_manager_app/constants/network_constants.dart';
import 'package:hotel_manager_app/exception/list_pass_exception.dart';
import 'package:hotel_manager_app/exception/network_exception.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class CreateBookingNetworkController extends GetxController {
  static CreateBookingNetworkController instance = Get.find();

  Future<List<String>> getAvailableRoomList(
      {required String roomType, required List<DateTime> dateList}) async {
    // print('network $kRoomsList');
    // // return kRoomsList;
    // var url = Uri(''); //TODO: add url
    // var response = await http.get(url);
    //
    // if (response.statusCode == 200) {
    //   var jsonResponse = jsonDecode(response.body) as List<String>;
    //   return jsonResponse;
    // } else {
    //   print(
    //       'getAvailableRoomsList Request failed with status: ${response.statusCode}.');
    //   return [];
    // }
    await Future.delayed(Duration(milliseconds: 100));

    return ['101', '206', '305'];
  }

  Future<List<String>> getAvailableDateRoomList(
      {required String roomType,
      required List<DateTime> dateList,
      required int noOfRooms}) async {

    String capitalizedRoomType = '';

    if (roomType == 'Single Room') {
      capitalizedRoomType ='SINGLE ROOM';
    } else if (roomType == 'Double Room') {
      capitalizedRoomType ='DOUBLE ROOM';
    } else if (roomType == 'Twin Room') {
      capitalizedRoomType ='TWIN ROOM';
    }
    try{
      Uri url = Uri.parse('${NetworkConstants.baseUrl}/rooms/available?roomType=$capitalizedRoomType&checkInDate=${DateFormat('yyyy-MM-dd').format(dateList[0])}&checkOutDate=${DateFormat('yyyy-MM-dd').format(dateList[1])}&noOfRooms=$noOfRooms');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String,dynamic>;
      List<String> availableRooms = List<String>.from(jsonResponse['roomList'] ?? []);
      return availableRooms;
    } else {
      print(
          'get available room list Request failed with status: ${response.statusCode}.');
      return [];
    }
    }
    catch(e){
      print('Error getting/parsing available room list data');
      print(e.toString());
      throw NetworkException(message: e.toString());
    }
  }

  Future<List<Map<String, dynamic>>> getRoomPrices() async {
    List<Map<String, dynamic>> currentRoomPrices = [];
    try {
      Uri url = Uri.parse('${NetworkConstants.baseUrl}/roomtype/price');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        try {
          var jsonResponse = jsonDecode(response.body) as List;
          currentRoomPrices = jsonResponse
              .map((roomType) => roomType as Map<String, dynamic>)
              .toList();
          return currentRoomPrices;
        } catch (e) {
          throw ListPassException(
              message: 'List Passing error at getting room prices');
        }
      } else {
        throw NetworkException(
            message:
                'Network Error due to : Status ${response.statusCode}, ${response.body}');
      }
    } catch (e) {
      print('Error getting/parsing room prices');
      print(e.toString());
      throw NetworkException(message: e.toString());
    }
  }
}
