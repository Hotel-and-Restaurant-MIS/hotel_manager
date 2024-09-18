import 'dart:collection';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:hotel_manager_app/constants/rooms.dart';
import 'package:hotel_manager_app/controllers/network/create_booking_network_controller.dart';

class CreateBookingDataController extends GetxController {
  static CreateBookingDataController instance = Get.find();

  CreateBookingNetworkController _cbnc =
      CreateBookingNetworkController.instance;

  List<String> _roomList = [''].obs;

  List get roomList => _roomList;

  void setRoomList(List<String> value) {
    _roomList = value;
  }

  Future<void> getRoomList({required roomType, required days}) async{
    var roomList = await _cbnc.getAvailableRoomList(roomType: roomType, dateList: days);
    setRoomList(roomList);
    print('data $roomList');
    //TODO: this is hard coded. get the data from the back end and connect with tha network controller.
  }

  Future<int> getAvailableRoomCount(
      {required String roomType, required List<DateTime> dateList}) async{
    return await _cbnc.getAvailableRoomCount(roomType: roomType, dateList: dateList);
  }

  Future<List<String>> getAvailableDateRoomList (
      {required String roomType, required List<DateTime> dateList,required int noOfRooms}) async{
    return await _cbnc.getAvailableDateRoomList(roomType:roomType,dateList:dateList,noOfRooms:noOfRooms);
  }
}
