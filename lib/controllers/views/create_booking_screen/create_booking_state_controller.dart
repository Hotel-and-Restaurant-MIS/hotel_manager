import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:hotel_manager_app/controllers/data/booking_data_controller.dart';
import 'package:hotel_manager_app/controllers/data/create_booking_data_controller.dart';
import 'package:hotel_manager_app/models/booking.dart';
import 'package:hotel_manager_app/models/form_valid_response.dart';

class CreateBookingStateController extends GetxController {
  static CreateBookingStateController instance = Get.find();

  CreateBookingDataController _cbdc = CreateBookingDataController.instance;

  final RegExp _nameRegExp = RegExp(r"^[a-zA-Z\s'-]+$");
  final RegExp _phoneRegExp =
      RegExp(r"^\+?(\d[\d-. ]+)?(\([\d-. ]+\))?[\d-. ]+\d$");
  final RegExp _emailRegExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
  final RegExp _nicRegExp = RegExp(r"^\d{9}[Vv]|\d{12}$");
  final RegExp _noOfRoomsRegExp = RegExp(r"^[1-9]\d*$");

  String? _name;
  String? _email;
  String? _phoneNumber;
  String? _nic;
  String? _roomType;
  int? _noOfRooms;
  RxList<DateTime> _days = [DateTime(2024, 3, 27), DateTime(2024, 3, 30)].obs;
  RxList? _availableRooms = [].obs;
  RxDouble _totalPrice = 0.0.obs;

  double? get totalPrice => _totalPrice.value;
  String? get name => _name;

  String? get email => _email;

  String? get phone_number => _phoneNumber;

  String? get nic => _nic;

  String? get roomType => _roomType;

  int? get noOfRooms => _noOfRooms;

  List<DateTime>? get days => _days.value;

  List get availableRooms => _availableRooms?.value ?? [];

  void setTotalPrice(double value) {
    _totalPrice.value = value;
  }

  void setAvailableRoomList(List<String> value) {
    _availableRooms?.value = value;
  }

  void setNoOfRooms(String value) {
    _noOfRooms = int.parse(value);
    getRoomList();
    calculateTotalPrice();
    update();
  }

  void setDays(List<DateTime> updatedValue) {
    _days.value = updatedValue;
    update();
    getRoomList();
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
    calculateTotalPrice();
    getRoomList();
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

  calculateTotalPrice() async {
    if (_noOfRooms != null &&
        _noOfRooms != 0 &&
        _roomType != null &&
        _roomType!.isNotEmpty) {
      if (roomType == 'Single Room') {
        _totalPrice.value = (_noOfRooms! * _cbdc.singleRoomPrice);
        print('total: $_totalPrice');
      } else if (roomType == 'Double Room') {
        _totalPrice.value = (_noOfRooms! * _cbdc.doubleRoomPrice);
      } else if (roomType == 'Twin Room') {
        _totalPrice.value = (_noOfRooms! * _cbdc.twinRoomPrice);
      }
    }
  }

  void getRoomList() async {
    if (_noOfRooms != null &&
        _noOfRooms != 0 &&
        _roomType != null &&
        _roomType!.isNotEmpty &&
        _days.isNotEmpty) {
      print('conditions are true for create booking');

      List<String> currentRoomList = await _cbdc.getAvailableDateRoomList(
          roomType: _roomType!, dateList: _days, noOfRooms: _noOfRooms!);

      setAvailableRoomList(currentRoomList);
    }
  }

  void setAvailableRoomToNull() {
    _availableRooms = null;
    _cbdc.setAvailableRoomToNull();
  }

  FormValidResponse validationForm() {
    final validationRules = [
      {
        'condition': _name == null || _name == '',
        'message': 'Name cannot be empty!'
      },
      {
        'condition': !_nameRegExp.hasMatch(_name ?? ''),
        'message': 'Name is not valid!'
      },
      {
        'condition': roomType == null,
        'message': 'Select room Type!',
      },
      {
        'condition': _email == null || _email == '',
        'message': 'Email cannot be empty!'
      },
      {
        'condition': !_emailRegExp.hasMatch(_email ?? ''),
        'message': 'Email is not valid!'
      },
      {
        'condition': _phoneNumber == null || _phoneNumber == '',
        'message': 'Phone number cannot be empty!'
      },
      {
        'condition': !_phoneRegExp.hasMatch(_phoneNumber ?? ''),
        'message': 'Phone number is not valid!'
      },
      {
        'condition': _nic == null || _nic == '',
        'message': 'NIC cannot be empty!'
      },
      {
        'condition': !_nicRegExp.hasMatch(_nic ?? ''),
        'message': 'NIC is not valid!',
      },
      {
        'condition': _noOfRooms == null,
        'message': 'No of rooms cannot be empty!'
      }
    ];
    for (final rule in validationRules) {
      if (rule['condition'] as bool) {
        return FormValidResponse(
            formValid: false, message: rule['message'] as String);
      }
    }
    return FormValidResponse(formValid: true);
  }
}
