
import 'package:hotel_manager_app/controllers/data/employee_data_controller.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/controllers/network/employee_data_network_controller.dart';
import 'package:hotel_manager_app/controllers/views/add_employee_screen/add_emp_state_controller.dart';
import 'package:hotel_manager_app/controllers/views/employee_screen/employee_list_builder.dart';

class ControllerInitializer {
  static bool _isIntialized = false;

  static bool get isInitialized => _isIntialized;

  static Future<void> initAllControllers() async {
    try {

      await Get.putAsync(() => EmployeeDataNetworkController.create());
      Get.put(EmployeeDataController());
      Get.put(EmployeeListBuilder());
      Get.put(AddEmpStateController());
      Get.put(EmployeeDataController());

      _isIntialized = true;
    } catch (e) {
      print('An Unexpected error occurs initiating controller.');
      rethrow;
    }
  }
}
