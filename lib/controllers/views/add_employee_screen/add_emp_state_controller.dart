import 'package:get/get.dart';
import 'package:hotel_manager_app/controllers/data/employee_data_controller.dart';
import 'package:hotel_manager_app/controllers/enum/role.dart';
import 'package:hotel_manager_app/models/employee.dart';
import 'package:hotel_manager_app/models/form_valid_response.dart';

class AddEmpStateController extends GetxController {
  static AddEmpStateController instance = Get.find();

  EmployeeDataController _edc = EmployeeDataController.instance;

  final RegExp _nameRegExp = RegExp(r"^[a-zA-Z\s'-]+$");
  final RegExp _phoneRegExp =
      RegExp(r"^\+?(\d[\d-. ]+)?(\([\d-. ]+\))?[\d-. ]+\d$");
  final RegExp _emailRegExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

  final RegExp _nicRegExp = RegExp(r"^\d{9}[Vv]|\d{12}$");
  String? _name;
  String? _email;
  String? _phone_number;
  String? _nic;
  String? _role;
  int? _roleId;

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
  int setRoleId() {
    if (_role == Role.Restaurant_Manager.name) {
      _roleId = 1;
    } else if (_role == Role.Cleaner.name) {
      _roleId = 5;
    } else if (_role == Role.Receptionist.name) {
      _roleId = 2;
    } else if (_role == Role.Waiter.name) {
      _roleId = 3;
    } else if (_role == Role.Chef.name) {
      _roleId = 4;
    } else {
      _roleId = 0; // Default or unknown role
    }
    return _roleId!; // Return the roleId after setting it
  }

  Future<void> addEmployee() async {
    await _edc.addEmployee(
      employee: Employee(
        name: _name!,
        email: _email!,
        nic: _nic!,
        phone_no: _phone_number!,
        roleId:1
      ),
    );
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
        'condition': _role == null,
        'message': 'Select job role!',
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
        'condition': _phone_number == null || _phone_number == '',
        'message': 'Phone number cannot be empty!'
      },
      {
        'condition': !_phoneRegExp.hasMatch(_phone_number ?? ''),
        'message': 'Phone number is not valid!'
      },
      {
        'condition': _nic == null || _nic == '',
        'message': 'NIC cannot be empty!'
      },
      {
        'condition': !_nicRegExp.hasMatch(_nic ?? ''),
        'message': 'NIC is not valid!',
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
