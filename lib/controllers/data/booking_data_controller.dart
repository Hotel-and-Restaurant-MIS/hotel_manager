import 'package:get/get.dart';
import 'package:hotel_manager_app/constants/booking_constants.dart';
import 'package:hotel_manager_app/controllers/network/booking_network_controller.dart';
import 'package:hotel_manager_app/controllers/network/create_booking_network_controller.dart';
import 'package:hotel_manager_app/exception/network_exception.dart';
import 'package:hotel_manager_app/models/booking.dart';

class BookingDataController extends GetxController {
  static BookingDataController instance = Get.find();

  BookingNetworkController _bdnc = BookingNetworkController.instance;
  CreateBookingNetworkController _cbnc = CreateBookingNetworkController.instance;
  RxMap<String, List<Booking>> _bookingDataMap = <String, List<Booking>>{}.obs;

  Map<String, List<Booking>> get bookingDataMap => _bookingDataMap.value;

  RxList<String> _availableRoomList = <String>[].obs;

  List<String> get availableRoomList => _availableRoomList.value;

  RxBool _isGettingBookings = false.obs;

  bool get isGettingBookings => _isGettingBookings.value;
  void setIsGettingBookings(bool value){
    _isGettingBookings.value = value;
  }

  void setRoomList(List<String> value) {
    _availableRoomList.value = value;
  }

  @override
  void onInit() async {
    super.onInit();
    await _initController();
  }

  Future<void> _initController() async {
    await _getAllBookings();
  }

  Future<void> _getAllBookings() async {
    setIsGettingBookings(true);
    List<Booking> bookingList = [];
    List<Map<String, dynamic>> bookingMapList = await _bdnc.getBookingList();
    List<Map<String, dynamic>> reservationMapList =
        await _bdnc.getReservationList();

    bookingMapList.forEach((Map<String, dynamic> bookingMap) {
      bookingList.add(Booking.fromMap(bookingMap));
    });
    reservationMapList.forEach((Map<String, dynamic> bookingMap) {
      bookingList.add(Booking.fromMap(bookingMap));
    });
    print('no of all bookings ${bookingList.length}');

    kBookingStatusList.forEach((status) => _bookingDataMap[status] = []);
    bookingList.forEach((booking) {
      if (_bookingDataMap.containsKey(booking.bookingStatus)) {
        _bookingDataMap[booking.bookingStatus]!.add(booking);
      }
    });
    setIsGettingBookings(false);
  }

  Future<List<String>> getAvailableDateRoomList(
      {required String roomType,
      required List<DateTime> dateList,
      required int noOfRooms}) async {
    _availableRoomList.value = await _cbnc.getAvailableDateRoomList(    //get available room list
        roomType: roomType, dateList: dateList, noOfRooms: noOfRooms);
    print('BDC room list: ${availableRoomList.length}');
    return availableRoomList;
  }

  Future<void> addBooking(Booking booking) async {
    try {
      Map<String, dynamic> bookingMap = await _cbnc.addBooking(booking);
      _bookingDataMap['Completed']?.add(Booking.fromMap(bookingMap));  // add booking to the Completed section
      print('data con added');
    } catch (e) {
      print(e.toString());
      throw NetworkException(message: 'error occurs adding new booking');
    }
  }
  
  Future<void> removeReservation(int reservationId) async {
    try{
      await _bdnc.removeReservation(reservationId);
      _bookingDataMap['OnGoing']?.removeWhere((booking) => booking.bookingId == reservationId); //remove reservation from the reservation list.
    }catch(e){
      print(e.toString());
    }

  }
}
