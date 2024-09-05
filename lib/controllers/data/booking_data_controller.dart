import 'package:get/get.dart';
import 'package:hotel_manager_app/controllers/network/booking_data_network_controller.dart';
import 'package:hotel_manager_app/models/booking.dart';

class BookingDataController extends GetxController {
  static BookingDataController instance = Get.find();

  BookingDataNetworkController _bdnc = BookingDataNetworkController.instance;

  Map<String, List<Booking>> _bookingDataMap = {};

  Map<String, List<Booking>> get bookingDataMap => _bookingDataMap;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('dataController to be initialized');
    _initController();
  }

  void _initController() {
    _bdnc.bookingMap.entries.forEach((entry) {
      String bookingStatus = entry.key;
      List bookingList = entry.value;

      _bookingDataMap[bookingStatus] = bookingList.map<Booking>((booking) {
        Booking _booking;
        try {
          print(booking);
          _booking = Booking.fromMap(booking);
        } catch (e) {
          print(e);
          rethrow;
        }
        return _booking;
      }).toList();
    });
  }
  void addBooking({required Booking booking}){
    //TODO: complete add booking method.
  }
}




























// import 'package:get/get.dart';
// import 'package:hotel_manager_app/constants/booking_constants.dart';
// import 'package:hotel_manager_app/controllers/network/booking_data_network_controller.dart';
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
