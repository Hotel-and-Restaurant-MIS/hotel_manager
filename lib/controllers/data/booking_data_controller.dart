import 'package:get/get.dart';
import 'package:hotel_manager_app/constants/booking_constants.dart';
import 'package:hotel_manager_app/controllers/network/booking_network_controller.dart';
import 'package:hotel_manager_app/controllers/network/create_booking_network_controller.dart';
import 'package:hotel_manager_app/models/booking.dart';

class BookingDataController extends GetxController {
  static BookingDataController instance = Get.find();

  BookingNetworkController _bdnc = BookingNetworkController.instance;
  CreateBookingNetworkController _cbnc = CreateBookingNetworkController.instance;
  RxMap<String, List<Booking>> _bookingDataMap = <String, List<Booking>>{}.obs;

  Map<String, List<Booking>> get bookingDataMap => _bookingDataMap.value;

  RxList<String> _availableRoomList = <String>[].obs;

  List<String> get availableRoomList => _availableRoomList.value;

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
  }

  Future<List<String>> getAvailableDateRoomList(
      {required String roomType,
      required List<DateTime> dateList,
      required int noOfRooms}) async {
    _availableRoomList.value = await _cbnc.getAvailableDateRoomList(
        roomType: roomType, dateList: dateList, noOfRooms: noOfRooms);
    print('BDC room list: ${availableRoomList.length}');
    return availableRoomList;
  }
}
