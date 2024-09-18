import 'dart:convert';

import 'package:get/get.dart';
import 'package:hotel_manager_app/constants/network_constants.dart';
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

  Future<int> getAvailableRoomCount(
      {required String roomType, required List<DateTime> dateList}) async {
    Map<String, String> queryParams = {
      'from': DateFormat('yyyy-MM-dd').format(dateList[0]),
      'to': DateFormat('yyyy-MM-dd').format(dateList[1]),
    };

    Uri url = Uri.http(
        '${NetworkConstants.baseUrl}/reservations/booking/roomType/available',
        '',
        queryParams);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as int;
      return jsonResponse;
    } else {
      print(
          'getAvailableRoomCount Request failed with status: ${response.statusCode}.');
      return 0;
    }
  }

  Future<List<String>> getAvailableDateRoomList(
      {required String roomType,
      required List<DateTime> dateList,
      required int noOfRooms}) async {
    // var url = Uri(''); //TODO: add url
    // var response = await http.get(url);
    //
    // if (response.statusCode == 200) {
    //   var jsonResponse = jsonDecode(response.body) as List<String>;
    //   return jsonResponse;
    // } else {
    //   print(
    //       'get booking available Request failed with status: ${response.statusCode}.');
    //   return [];
    // }

    return ['105', '205', '303', '401', '409', '511'];
  }
}
