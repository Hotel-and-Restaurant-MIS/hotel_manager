import 'package:get/get.dart';
import 'package:hotel_manager_app/models/employee.dart';


class AddEmpStateController extends GetxController{
  static AddEmpStateController instance = Get.find();

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

  void addEmployee(Employee newEmployee){

  }
}