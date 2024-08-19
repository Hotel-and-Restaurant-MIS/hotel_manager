import 'package:get/get.dart';
import 'package:hotel_manager_app/controllers/data/employee_data_controller.dart';
import 'package:hotel_manager_app/models/employee.dart';


class AddEmpStateController extends GetxController{
  static AddEmpStateController instance = Get.find();
  
  EmployeeDataController _edc = EmployeeDataController.instance;

  String? _name;
  String? _email;
  String? _phone_number;
  String? _nic;
  String? _role;

  String? get name => _name;

  String? get email => _email;

  String? get phone_number => _phone_number;

  String? get nic => _nic;

  String? get role => _role;

  void setName(String name) {
    _name = name;
    update();
  }
  void setEmail(String email) {
    _email = email;
    update();
  }
  void setPhoneNumber(String num) {
    _phone_number = num;
    update();
  }
  void setNIC(String nic) {
    _nic = nic;
    update();
  }
  void setRole(String role) {
    _role = role;
    update();
  }

  void addEmployee(){
    _edc.addEmployee(employee: Employee(name: _name!, role: _role!, email: _email!, nic: _nic!, phone_no: _phone_number!, image_url: ''));
  }
}