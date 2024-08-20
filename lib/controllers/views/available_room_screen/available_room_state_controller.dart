import 'package:get/get.dart';
import 'package:hotel_manager_app/controllers/data/create_booking_data_controller.dart';

class AvailableRoomStateController extends GetxController {
  static AvailableRoomStateController instance = Get.find();

  CreateBookingDataController _cbdc = CreateBookingDataController.instance;

  RxInt _presidentialSuiteCount = 0.obs;
  RxInt _suiteCount = 0.obs;
  RxInt _deluxeCount = 0.obs;
  RxList<DateTime> _days = [DateTime(2024, 3, 27), DateTime(2024, 3, 30)].obs;

  int? get presidentialSuiteCount => _presidentialSuiteCount.value;
  int? get suiteCount => _suiteCount.value;
  int? get DeluxeCount => _deluxeCount.value;
  List<DateTime>? get days => _days.value;

  void setPresidentialSuiteCount(int value) {
    _presidentialSuiteCount.value = value;
    update();
  }

  void setSuiteCount(int value) {
    _suiteCount.value = value;
    update();
  }

  void setDeluxeCount(int value) {
    _deluxeCount.value = value;
    update();
  }

  void setDays(List<DateTime> updatedValue) {
    _days.value = updatedValue;
    getAllAvailableRooms(dateList: updatedValue);
    update();
  }

  void getAllAvailableRooms({required List<DateTime> dateList}) {

    var suiteCount =
        _cbdc.getAvailableNoOfRooms(roomType: 'Suite', dateList: dateList);
    setSuiteCount(suiteCount);
    var presidentialSuiteCount = _cbdc.getAvailableNoOfRooms(
        roomType: 'Presidential Suite', dateList: dateList);
    setPresidentialSuiteCount(presidentialSuiteCount);
    var deluxeCount =
        _cbdc.getAvailableNoOfRooms(roomType: 'Deluxe', dateList: dateList);
    setDeluxeCount(deluxeCount);
  }
}
