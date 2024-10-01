import 'dart:convert';
import 'package:get/get.dart';
import 'package:hotel_manager_app/constants/network_constants.dart';
import 'package:hotel_manager_app/exception/list_pass_exception.dart';
import 'package:hotel_manager_app/exception/network_exception.dart';
import 'package:hotel_manager_app/models/booking.dart';
import 'package:http/http.dart' as http;

class BookingNetworkController extends GetxController {
  static BookingNetworkController instance = Get.find();

  Future<Map<String, List<dynamic>>> getBooking() async {

    List<Map<String, dynamic>> bookingList = await getBookingList();
    List<Map<String, dynamic>> reservationList = await getReservationList();

    Map<String, List<dynamic>> bookingAndReservationMap = {};
    bookingAndReservationMap['Ongoing'] = reservationList;
    bookingAndReservationMap['Completed'] = bookingList;

    return bookingAndReservationMap;
  }

  Future<List<Map<String, dynamic>>> getReservationList() async {
    List<Map<String, dynamic>> reservationList = [];

    Uri url = Uri.parse('${NetworkConstants.baseUrl}/reservations/all');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        var jsonResponse = jsonDecode(response.body) as List;
        reservationList = jsonResponse
            .map((reservation) => reservation as Map<String, dynamic>)
            .toList();
        //reservationList = decodedList.cast<Map<String, dynamic>>();
        print('###length of reservationList:${reservationList.length}');
        return reservationList;
      } catch (e) {
        print(e);
        throw ListPassException(
            message: 'json decode error in getReservationList');
      }
    } else {
      print(
          'get reservation Request failed with status: ${response.statusCode}.');
      throw NetworkException();
    }
  }

  Future<List<Map<String, dynamic>>> getBookingList() async {
    List<Map<String, dynamic>> bookingList = [];

    Uri url = Uri.parse('${NetworkConstants.baseUrl}/reservations/booking/all');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        var jsonResponse = jsonDecode(response.body) as List;
        bookingList = jsonResponse
            .map((booking) => booking as Map<String, dynamic>)
            .toList();
        print('###length of bookingsList:${bookingList.length}');
        return bookingList;
      } catch (e) {
        print(e);
        throw ListPassException(message: 'json decode error in getBookingList');
      }
    } else {
      print('get booking Request failed with status: ${response.statusCode}.');
      throw NetworkException();
    }
  }

  // Future<Map<String, dynamic>> addBooking({required Booking booking}) async {
  //   Map<String, dynamic> bookingMap = {};
  //   Uri url = Uri.parse('${NetworkConstants.baseUrl}/');
  // }
}

//below can get dummy booking data
//
// import 'package:get/get.dart';
// import 'package:hotel_manager_app/components/booking_status.dart';
// import '../../constants/booking_constants.dart';
//
// class BookingNetworkController extends GetxController {
//   static BookingNetworkController instance = Get.find();
//
//   Map<String, dynamic> _bookingMap = {};
//   Map<String, dynamic> get bookingMap => _bookingMap;
//
//   BookingNetworkController._();
//
//   static Future<BookingNetworkController> create() async {
//     BookingNetworkController controller = BookingNetworkController._();
//     await controller._initController();
//
//     return controller;
//   }
//
//   Future<void> _initController() async {
//     await Future.delayed(
//       Duration(
//         milliseconds: 500,
//       ),
//     ); //simulate network delay
//
   // kBookingStatusList.forEach((status) => _bookingMap[status] = []);
//     kBookingList.forEach((booking) {
//       List currentList = _bookingMap[booking.bookingStatus];
//       currentList.add(booking.toMap());
//       _bookingMap[booking.bookingStatus] = currentList;
//     });
//   }
// }
//
//
//
//
//
//
//
