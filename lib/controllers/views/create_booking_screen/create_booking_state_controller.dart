import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:hotel_manager_app/controllers/data/booking_data_controller.dart';
import 'package:hotel_manager_app/models/booking.dart';

class CreateBookingStateController extends GetxController {
  static CreateBookingStateController instance = Get.find();

  BookingDataController _bdc = BookingDataController.instance;

  String? _name;
  String? _email;
  String? _phoneNumber;
  String? _nic;
  String? _roomType;
  String? _noOfRooms;
  RxList<DateTime> _days = [DateTime(2024, 3, 27), DateTime(2024, 3, 30)].obs;

  String? get name => _name;

  String? get email => _email;

  String? get phone_number => _phoneNumber;

  String? get nic => _nic;

  String? get roomType => _roomType;

  String? get noOfRooms => _noOfRooms;

  List<DateTime>? get days => _days.value;

  void setNoOfRooms(String value){
    _noOfRooms = value;
    update();
  }
  void setDays(List<DateTime> updatedValue) {
    _days.value = updatedValue;
    update();
    print(_days[0]);
    print(_days[1]);
  }

  void setName(String value) {
    _name = value;
    update();
  }

  void setEmail(String value) {
    _email = value;
    update();
  }



  void setRoomType(String value) {
    _roomType = value;
    update();
  }

  void setNIC(String value) {
    _nic = value;
    update();
  }

  void setPhoneNumber(String value) {
    _phoneNumber = value;
    update();
  }

  // void addBooking() {
  //   _bdc.addBooking(
  //       booking: Booking(
  //           customerName: _name!,
  //           phoneNumber: _phoneNumber!,
  //           nicNumber: _nic!,
  //           email: _email!,
  //           bookingStatus: 'Completed',
  //           roomType: roomType,
  //           noOfRooms: _noOfRooms!,
  //           noOfDays: noOfDays,
  //           arrivalDate: _arrivalDate!,
  //           depatureDate: _departureDate!,
  //           totalAmount: totalAmount));
  // }
}
