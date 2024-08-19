import 'dart:collection';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:hotel_manager_app/constants/rooms.dart';
import 'package:hotel_manager_app/controllers/network/create_booking_network_controller.dart';

class CreateBookingDataController extends GetxController{


  static CreateBookingDataController instance = Get.find();

  CreateBookingNetworkController _cbnc = CreateBookingNetworkController.instance;

  RxList _roomList =[].obs;

  List get roomList => _roomList.value;


  void setRoomList(RxList value) {
    _roomList = value;
  }

  void getRoomList({required roomType, required days, required noOfRooms}){
    var roomList = _cbnc.getAvailableRooms(roomType: roomType, days: days, noOfRooms: noOfRooms);
    setRoomList(roomList.obs);
    print('data $roomList');
    //TODO: this is hard coded. get the data from the back end and connect with tha network controller.
  }
}