import 'package:get/get.dart';
import 'package:hotel_manager_app/controllers/data/booking_data_controller.dart';
import 'package:hotel_manager_app/models/booking.dart';

class BookingDetailStateController extends GetxController {
  static BookingDetailStateController instance = Get.find();

  BookingDataController _bdc = BookingDataController.instance;
  RxBool _isVisible = false.obs;

  bool get isVisible => _isVisible.value;
  bool _isAvailable = false;

  RxBool isCalling = false.obs;

  bool get isAvailable => _isAvailable;

  void setIsAvailable(bool value) {
    _isAvailable = value;
  }

  RxInt _isAvailableRoomCount = 0.obs;

  int get isAvailableRoomCount => _isAvailableRoomCount.value;

  void setIsAvailableRoomCount(int value) {
    _isAvailableRoomCount.value = value;
  }

  RxList<String> _availableRoomList = <String>[].obs;
  List<String> get availableRoomList => _availableRoomList.value;

  void setAvailableRoomList(List<String> value) {
    _availableRoomList.assignAll(value);
  }

  void setIsVisible(bool value) {
    _isVisible.value = value;
  }

  void changeVisibility() {
    print(isVisible);
    setIsVisible(!isVisible);
  }

  void resetData() {
    setAvailableRoomList([]);
  }

  Future<void> addBooking(Booking booking) async {
    isCalling.value = true;
    await _bdc.addBooking(
      Booking(
        customerName: booking.customerName,
        phoneNumber: booking.phoneNumber,
        nicNumber: booking.nicNumber,
        email: booking.email,
        roomType: booking.roomType,
        noOfRooms: booking.noOfRooms,
        arrivalDate: booking.arrivalDate,
        departureDate: booking.departureDate,
        totalAmount: booking.totalAmount,
        roomList: availableRoomList,
      ),
    );
    await removeReservation(booking.bookingId!);
    print('state added');
    isCalling.value = false;
  }

  Future<void> removeReservation(int reservationId) async {
    isCalling.value = true;
    try{
      print('state start');
      await _bdc.removeReservation(reservationId);
      print('satate end');
    }
    catch(e){
      print(e.toString());
    }
    isCalling.value = false;
  }
  Future<bool> checkAvailability(
      {required int noOfRooms,
      required DateTime arrivalDate,
      required DateTime departureDAte,
      required String roomType}) async {
    List<DateTime> dateList = [];
    dateList.add(arrivalDate);
    dateList.add(departureDAte);
    List<String> roomList = await _bdc.getAvailableDateRoomList(
      roomType: roomType,
      dateList: dateList,
      noOfRooms: noOfRooms,
    );
    setAvailableRoomList(roomList);
    setIsAvailableRoomCount(roomList.length);
    print('available room count : ${availableRoomList.length}');
    if (roomList.length == noOfRooms) {
      setIsAvailable(true);
      return true;
    } else {
      setIsAvailable(false);
      return false;
    }
  }
}
