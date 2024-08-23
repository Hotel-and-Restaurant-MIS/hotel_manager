import 'package:get/get.dart';
import 'package:hotel_manager_app/models/employee.dart';


class EmployeeDataNetworkController extends GetxController{
  static EmployeeDataNetworkController instance = Get.find();

  Future<List<Map<String, dynamic>>> getEmployees() async{
    //TODO:send http request
    List<Map<String, dynamic>> currentEmployeeList = [];
    return currentEmployeeList;
  }

  Future<Employee> addEmploy({required Employee employee}) async{
    //TODO:send http with jason employee
    Map<String,dynamic> employeeMap = employee.toMap();
    return Employee(name: '', role: 'Chef', id: '001', email: 'email', nic: 'nic', phone_no: 'phone_no');
  }


}
