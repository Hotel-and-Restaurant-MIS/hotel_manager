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

      _bookingDataMap[bookingStatus] = bookingList
          .map<Booking>((booking) {
            Booking _booking;
            try{
              print(booking);
              _booking = Booking.fromMap(booking);
            }catch(e){
              print(e);
              rethrow;
            }
        return _booking;
      })
          .toList();
      print('data controller init');
    });

  }
}
