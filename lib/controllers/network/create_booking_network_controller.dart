import 'package:get/get.dart';
import 'package:hotel_manager_app/constants/rooms.dart';

class CreateBookingNetworkController extends GetxController{
  static CreateBookingNetworkController instance = Get.find();

  List getAvailableRooms({required roomType, required days, required noOfRooms}){
    print('network $kRoomsList');
    return kRoomsList;
  }
}