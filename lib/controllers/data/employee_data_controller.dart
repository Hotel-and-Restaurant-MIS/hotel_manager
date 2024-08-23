import 'package:get/get.dart';
import 'package:hotel_manager_app/controllers/network/employee_data_network_controller.dart';
import 'package:hotel_manager_app/models/employee.dart';

class EmployeeDataController extends GetxController {
  static EmployeeDataController instance = Get.find();
  final EmployeeDataNetworkController _ednc = EmployeeDataNetworkController.instance;

  List<Employee> _employeeList = [];

  List<Employee> get employeeList => _employeeList;

  EmployeeDataController._();

  static Future<EmployeeDataController> create() async {
    final EmployeeDataController controller = EmployeeDataController._();
    await controller._initController();
    return controller;
  }

  Future<void> _initController() async {
    _employeeList = await _getEmployeeList();
  }

  Future<List<Employee>> _getEmployeeList() async {
    List<Employee> employeeList = [];
    try{
      List<Map<String,dynamic>> employeeMapList = await _ednc.getEmployees();
      employeeMapList.forEach((Map<String, dynamic> employeeMap){
        employeeList.add(Employee.fromMap(employeeMap));
      });
    }catch(e){

    }
    finally{
      return employeeList;
    }
  }

  Future<void> addEmployee({required Employee employee}) async{
    Employee newEmployee = await _ednc.addEmploy(employee: employee);
    _employeeList.add(newEmployee);
  }


}
