import 'package:get/get.dart';
import 'package:hotel_manager_app/constants/booking_constants.dart';
import 'package:hotel_manager_app/controllers/network/booking_network_controller.dart';
import 'package:hotel_manager_app/controllers/network/create_booking_network_controller.dart';
import 'package:hotel_manager_app/models/booking.dart';

class BookingDataController extends GetxController {
  static BookingDataController instance = Get.find();

  BookingNetworkController _bdnc = BookingNetworkController.instance;
  CreateBookingNetworkController _cbnc = CreateBookingNetworkController.instance;
  Map<String, List<Booking>> _bookingDataMap = {};

  Map<String, List<Booking>> get bookingDataMap => _bookingDataMap;
  RxList<String> _availableRoomList = [''].obs;


  List<String> get availableRoomList => _availableRoomList.value;

  void setRoomList(List<String> value) {
    _availableRoomList.value = value;
  }

  @override
  void onInit() async {
    super.onInit();
    print('dataController to be initialized');
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
    return availableRoomList;
  }

  void addBooking({required Booking booking}) {
    //TODO: complete add booking method.
  }
}

// import 'package:get/get.dart';
// import 'package:hotel_manager_app/constants/booking_constants.dart';
// import 'package:hotel_manager_app/controllers/network/booking_network_controller.dart';
// import 'package:hotel_manager_app/models/booking.dart';
//
// class BookingDataController extends GetxController {
//   static BookingDataController instance = Get.find();
//
//   final BookingDataNetworkController _bdnc = BookingDataNetworkController.instance;
//
//   Map<String, List<Booking>> _bookingDataMap = {};
//
//   Map<String, List<Booking>> get bookingDataMap => _bookingDataMap;
//
//   BookingDataController._();
//
//   static Future<BookingDataController> create() async {
//     final BookingDataController controller = BookingDataController._();
//     await controller._initController();
//     return controller;
//   }
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     _initController();
//   }
//
//   Future<void> _initController() async {
//     _bookingDataMap = await _getBookingList();
//   }
//
//   Future<List<Booking>> _getBookingList() async {
//     Map<String, List<Booking>> bookingListMap = {};
//
//     try {
//       Map<String, List<dynamic>> bookingMap = await _bdnc.getBooking();
//       for (var entry in bookingMap.entries) {
//         String key = entry.key; //status
//         List value = entry.value; // bookings
//
//         bookingListMap[key] = value
//             .map<Booking>((singleBooking) => Booking.fromMap(singleBooking))
//             .toList();
//       }
//     } catch (e) {
//       print(e);
//       print('error occurs getting booking data');
//     } finally {
//       return bookingListMap;
//     }
//     return kBookingList;
//   }
//
//   void addBooking({required Booking booking}) {
//     //TODO: complete add booking method.
//   }
// }
