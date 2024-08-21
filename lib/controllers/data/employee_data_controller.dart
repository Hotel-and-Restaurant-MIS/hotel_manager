import 'package:get/get.dart';
import 'package:hotel_manager_app/controllers/network/employee_data_network_controller.dart';
import 'package:hotel_manager_app/models/employee.dart';

class EmployeeDataController extends GetxController {
  static EmployeeDataController instance = Get.find();

  EmployeeDataNetworkController _ednc = EmployeeDataNetworkController.instance;

  List get employeeList => _ednc.employeeList;

  Future<void> addEmployee({required Employee employee}) async {

    //TODO: add new employee to the database.
  }
}
