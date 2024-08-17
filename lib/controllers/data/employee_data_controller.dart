

import 'package:get/get.dart';
import 'package:hotel_manager_app/controllers/network/employee_data_network_controller.dart';

class EmployeeDataController extends GetxController{
  static EmployeeDataController instance = Get.find();

  EmployeeDataNetworkController _ednc = EmployeeDataNetworkController.instance;

  List get employeeList => _ednc.employeeList;
}