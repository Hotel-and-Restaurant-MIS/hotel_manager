import 'dart:convert';

import 'package:get/get.dart';
import 'package:hotel_manager_app/constants/network_constants.dart';
import 'package:hotel_manager_app/exception/list_pass_exception.dart';
import 'package:hotel_manager_app/exception/network_exception.dart';
import 'package:hotel_manager_app/models/booking.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class CreateBookingNetworkController extends GetxController {
  static CreateBookingNetworkController instance = Get.find();

  Future<List<String>> getAvailableDateRoomList(
      {required String roomType,
      required List<DateTime> dateList,
      required int noOfRooms}) async {
    String capitalizedRoomType = '';

    if (roomType == 'Single Room') {
      capitalizedRoomType = 'SINGLE ROOM';
    } else if (roomType == 'Double Room') {
      capitalizedRoomType = 'DOUBLE ROOM';
    } else if (roomType == 'Twin Room') {
      capitalizedRoomType = 'TWIN ROOM';
    }
    try {
      Uri url = Uri.parse(
          '${NetworkConstants.baseUrl}/rooms/available?roomType=$capitalizedRoomType&checkInDate=${DateFormat('yyyy-MM-dd').format(dateList[0])}&checkOutDate=${DateFormat('yyyy-MM-dd').format(dateList[1])}&noOfRooms=$noOfRooms');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        List<String> availableRooms =
            List<String>.from(jsonResponse['roomList'] ?? []);
        return availableRooms;
      } else {
        print(
            'get available room list Request failed with status: ${response.statusCode}.');
        return [];
      }
    } catch (e) {
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

  Future<Map<String, dynamic>> addBooking(Booking booking) async {
    try {
      var body = jsonEncode(booking.toMap());
      Uri url = Uri.parse('${NetworkConstants.baseUrl}/bookings/add');
      var response = await http.post(
        url,
        headers: {'content-type': 'application/json'},
        body: body,
      );

      if(response.statusCode ==201){
        try{
          Map<String,dynamic> bookingMap = jsonDecode(response.body) as Map<String,dynamic>;
          return bookingMap;
        }catch(e){
          throw ListPassException(message: 'error in parsing added new booking');
        }
      }else{
        print('add Booking Request failed with status: ${response.statusCode}.');
        throw NetworkException();
      }
    } catch (e) {
      print('Error adding new booking');
      print(e.toString());
      throw NetworkException(message: e.toString());
    }
  }
}
