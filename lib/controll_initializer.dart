import 'package:hotel_manager_app/controllers/data/available_rooms_data_controller.dart';
import 'package:hotel_manager_app/controllers/data/booking_data_controller.dart';
import 'package:hotel_manager_app/controllers/data/create_booking_data_controller.dart';
import 'package:hotel_manager_app/controllers/data/employee_data_controller.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/controllers/data/login_data_controller.dart';
import 'package:hotel_manager_app/controllers/network/available_room_network_controller.dart';
import 'package:hotel_manager_app/controllers/network/booking_network_controller.dart';
import 'package:hotel_manager_app/controllers/network/create_booking_network_controller.dart';
import 'package:hotel_manager_app/controllers/network/employee_network_controller.dart';
import 'package:hotel_manager_app/controllers/network/login_network_controller.dart';
import 'package:hotel_manager_app/controllers/views/add_employee_screen/add_emp_state_controller.dart';
import 'package:hotel_manager_app/controllers/views/available_room_screen/available_room_state_controller.dart';
import 'package:hotel_manager_app/controllers/views/booking_detail_screen/booking_detail_state_controller.dart';
import 'package:hotel_manager_app/controllers/views/booking_detail_screen/completed_room_grid_builder.dart';
import 'package:hotel_manager_app/controllers/views/booking_management_screen/booking_list_builder.dart';
import 'package:hotel_manager_app/controllers/views/create_booking_screen/room_grid_builder.dart';
import 'package:hotel_manager_app/controllers/views/employee_screen/employee_list_builder.dart';
import 'package:hotel_manager_app/controllers/views/login_screen/login_state_controller.dart';

import 'controllers/views/create_booking_screen/create_booking_state_controller.dart';

class ControllerInitializer {
  static bool _isIntialized = false;

  static bool get isInitialized => _isIntialized;

  static Future<void> initAllControllers() async {
    try {
      Get.put(LoginNetworkController());
      Get.put(LoginDataController());
      Get.put(LoginStateController());
      Get.put(CreateBookingNetworkController());
      await Get.putAsync(() => CreateBookingDataController.create());
      Get.put(AvailableRoomsNetworkController());
      Get.put(AvailableRoomsDataController());
      Get.put(AvailableRoomStateController());
      Get.put(EmployeeDataNetworkController());

      await Get.putAsync(() => EmployeeDataController.create());
      //await Get.putAsync(() => BookingNetworkController.create());
      Get.put(BookingNetworkController());
      Get.put(BookingDataController());
      Get.put(BookingDetailStateController());
      Get.put(CompletedRoomGridBuilder());
      Get.put(RoomGridBuilder());
      Get.put(EmployeeListBuilder());
      Get.put(AddEmpStateController());

      Get.put(BookingListBuilder());
      Get.put(CreateBookingStateController());

      _isIntialized = true;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}










// Get.put(EmployeeDataNetworkController());
// Get.put(BookingDataNetworkController());
// await Get.putAsync(() => EmployeeDataController.create());
// await Get.putAsync(() => BookingDataController.create());
// Get.put(CreateBookingNetworkController());
// Get.put(CreateBookingDataController());
// Get.put(AvailableRoomStateController());
// Get.put(RoomGridBuilder());
// Get.put(EmployeeListBuilder());
// Get.put(AddEmpStateController());
// Get.put(BookingListBuilder());
// Get.put(CreateBookingStateController());
// Get.put(BookingDetailStateController());
// Get.put(CompletedRoomGridBuilder());