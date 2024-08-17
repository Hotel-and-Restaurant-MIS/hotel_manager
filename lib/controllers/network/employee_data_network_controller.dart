import 'package:get/get.dart';
import 'package:hotel_manager_app/constants/employees_constants.dart';

class EmployeeDataNetworkController extends GetxController{
  static EmployeeDataNetworkController instance = Get.find();
  List _employeeList=[];


  List get employeeList => _employeeList;

  set employeeList(List value) {
    _employeeList = value;
  }

  EmployeeDataNetworkController._();
  static Future<EmployeeDataNetworkController> create() async{
    EmployeeDataNetworkController controller = EmployeeDataNetworkController._();
    await controller._initController();
    return controller;
  }

  Future<void> _initController() async{
    await Future.delayed(Duration(milliseconds: 500,),);

    employeeList = kEmployeeList;

  }
}
