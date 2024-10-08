import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:hotel_manager_app/controllers/data/booking_data_controller.dart';
import 'package:hotel_manager_app/controllers/data/employee_data_controller.dart';
import 'package:hotel_manager_app/controllers/network/create_booking_network_controller.dart';
import 'package:hotel_manager_app/exception/network_exception.dart';
import 'package:hotel_manager_app/models/booking.dart';
import 'package:hotel_manager_app/models/roomType.dart';

class CreateBookingDataController extends GetxController {
  static CreateBookingDataController instance = Get.find();

  CreateBookingNetworkController _cbnc =
      CreateBookingNetworkController.instance;
  BookingDataController _bdc = BookingDataController.instance;
  CreateBookingDataController._();

  static Future<CreateBookingDataController> create() async {
    final CreateBookingDataController controller =
        CreateBookingDataController._();
    await controller._initController();
    return controller;
  }
  RxBool _isRoomsAvailable = false.obs;
  get isRoomsAvailable => _isRoomsAvailable.value;
  void setIsRoomsAvailable(bool value){
    _isRoomsAvailable.value = value;
  }
  RxInt _availableRoomCount = 0.obs;
  get availableRoomCount => _availableRoomCount.value;
  void setAvailableRoomCount(int value){
    _availableRoomCount.value = value;
  }

  Future<void> _initController() async {
    await getRoomPrices();
  }

  RxList<String> _availableRoomList = [''].obs;

  double _singleRoomPrice = 0;
  double _doubleRoomPrice = 0;
  double _twinRoomPRice = 0;

  double get singleRoomPrice => _singleRoomPrice;

  void setSingleRoomPrice(double value) {
    _singleRoomPrice = value;
  }

  double get doubleRoomPrice => _doubleRoomPrice;

  void setDoubleRoomPrice(double value) {
    _doubleRoomPrice = value;
  }

  double get twinRoomPrice => _twinRoomPRice;

  void setTwinRoomPRice(double value) {
    _twinRoomPRice = value;
  }

  List<String> get availableRoomList => _availableRoomList.value;

  void setAvailableRoomToNull() {
    _availableRoomList.value = [];
  }

  void setRoomList(List<String> value) {
    _availableRoomList.value = value;
  }

  Future<List<String>> getAvailableDateRoomList(
      {required String roomType,
      required List<DateTime> dateList,
      required int noOfRooms}) async {
    setAvailableRoomCount(0);
    _availableRoomList.value = await _cbnc.getAvailableDateRoomList(
        roomType: roomType, dateList: dateList, noOfRooms: noOfRooms);
    if(_availableRoomList.length == noOfRooms){
      setIsRoomsAvailable(true);

    }else{
      setIsRoomsAvailable(false);
      setAvailableRoomCount(_availableRoomList.length);
    }
    return availableRoomList;
  }

  Future<void> getRoomPrices() async {
    List<RoomType> roomTypeList = [];
    try {
      List<Map<String, dynamic>> roomPrices = await _cbnc.getRoomPrices();

      roomPrices.forEach((Map<String, dynamic> roomPriceMap) {
        roomTypeList.add(RoomType.fromMap(roomPriceMap));
      });
    } catch (e) {
      print('error in getRoomPrice');
      print(e.toString());
    }

    for (RoomType roomType in roomTypeList) {
      if (roomType.roomTypeName == 'SINGLE ROOM') {
        setSingleRoomPrice(roomType.roomPrice);
        print(roomType.roomPrice);
      } else if (roomType.roomTypeName == 'DOUBLE ROOM') {
        setDoubleRoomPrice(roomType.roomPrice);
        print(roomType.roomPrice);
      } else if (roomType.roomTypeName == 'TWIN ROOM') {
        setTwinRoomPRice(roomType.roomPrice);
        print(roomType.roomPrice);
      }
    }
  }


}
