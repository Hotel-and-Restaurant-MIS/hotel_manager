import 'package:get/get.dart';
import 'package:hotel_manager_app/controllers/data/available_rooms_data_controller.dart';

class AvailableRoomStateController extends GetxController {
  static AvailableRoomStateController instance = Get.find();

  AvailableRoomsDataController _ardc = AvailableRoomsDataController.instance;

  RxBool isLoading = false.obs;

  RxList<DateTime> _days = [DateTime(2024, 3, 27), DateTime(2024, 3, 30)].obs;

  List<DateTime>? get days => _days.value;

  Future<void> setDays(List<DateTime> updatedValue) async{
    _days.value = updatedValue;
    await getAllAvailableRooms(dateList: updatedValue);
    update();
  }

  //get the available room count for all room types
  Future<void> getAllAvailableRooms({required List<DateTime> dateList}) async {
    isLoading.value = true;
   await _ardc.getAvailableRoomCount(dateList: dateList);
    isLoading.value = false;
  }
}
