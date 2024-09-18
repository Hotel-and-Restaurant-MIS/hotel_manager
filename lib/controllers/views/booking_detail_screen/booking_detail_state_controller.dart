import 'package:get/get.dart';
import 'package:hotel_manager_app/controllers/data/create_booking_data_controller.dart';

class BookingDetailStateController extends GetxController{
  static BookingDetailStateController instance = Get.find();

  CreateBookingDataController _cbdc = CreateBookingDataController.instance;

  RxBool _isVisible = false.obs;

  bool get isVisible => _isVisible.value;
   bool _isAvailable =false;

  bool get isAvailable => _isAvailable;

  void setIsAvailable(bool value) {
    _isAvailable = value;
  }

  List<String> _availableRoomList=[];
  List<String> get availableRoomList => _availableRoomList;


  void setAvailableRoomList(List<String> value) {
    _availableRoomList = value;
  }

  void setIsVisible(bool value) {
    _isVisible.value = value;
  }
  void changeVisibility(){
    print(isVisible);
    print('button pressed');
    setIsVisible(!isVisible!);
  }
  Future<bool> checkAvailability (
      {required int noOfRooms,
      required DateTime arrivalDate,
      required DateTime departureDAte,
      required String roomType}) async{
    List<DateTime> dateList=[];
    dateList.add(arrivalDate);
    dateList.add(departureDAte);
    List<String> roomList= await _cbdc.getAvailableDateRoomList(roomType: roomType, dateList: dateList, noOfRooms: noOfRooms);
    setAvailableRoomList(roomList);
    if(roomList.isEmpty){
      setIsAvailable(false);
      return false;
    }else{
      setIsAvailable(true);
      return true;
    }
  }
}
