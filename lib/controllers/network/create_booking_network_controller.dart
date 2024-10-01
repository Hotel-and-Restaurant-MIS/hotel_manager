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
