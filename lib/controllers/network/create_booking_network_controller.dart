import 'package:get/get.dart';
import 'package:hotel_manager_app/constants/rooms.dart';

class CreateBookingNetworkController extends GetxController{
  static CreateBookingNetworkController instance = Get.find();

  List getAvailableRoomsList({required roomType, required days}){
    print('network $kRoomsList');
    return kRoomsList;
  }

  int getAvailableRoomCount({required String roomType,required List<DateTime> dateList}){

    return 10;
}
}