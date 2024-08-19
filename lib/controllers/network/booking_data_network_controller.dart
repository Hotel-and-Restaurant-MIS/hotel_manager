import 'package:get/get.dart';
import 'package:hotel_manager_app/components/booking_status.dart';
import '../../constants/booking_constants.dart';

class BookingDataNetworkController extends GetxController {
  static BookingDataNetworkController instance = Get.find();

  Map<String, dynamic> _bookingMap = {};
  Map<String, dynamic> get bookingMap => _bookingMap;

  BookingDataNetworkController._();

  static Future<BookingDataNetworkController> create() async {
    BookingDataNetworkController controller = BookingDataNetworkController._();
    await controller._initController();

    return controller;
  }

  Future<void> _initController() async {
    await Future.delayed(
      Duration(
        milliseconds: 500,
      ),
    ); //simulate network delay

    kBookingStatusList.forEach((status) => _bookingMap[status] = []);
    kBookingList.forEach((booking) {
      List currentList = _bookingMap[booking.bookingStatus];
      currentList.add(booking.toMap());
      _bookingMap[booking.bookingStatus] = currentList;
    });
  }
}
