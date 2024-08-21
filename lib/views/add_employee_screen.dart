import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/components/button_blue.dart';
import 'package:hotel_manager_app/components/input_text_field.dart';
import 'package:hotel_manager_app/constants/employee_roles.dart';
import 'package:hotel_manager_app/constants/sub_title_text_style.dart';
import 'package:hotel_manager_app/views/employee_screen.dart';

import '../controllers/views/add_employee_screen/add_emp_state_controller.dart';

class AddEmployeeScreen extends StatelessWidget {
  AddEmpStateController _addEmpStateController = AddEmpStateController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      child: Icon(
                        Icons.arrow_back,
                        size: 30.0,
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Add Employee',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //TODO: add image get method for the employee
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  children: [
                    InputTextField(
                        title: 'Name',
                        place_holder: 'Enter name',
                        submit_controller: _addEmpStateController.setName),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 15.0, bottom: 8.0, top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Role',
                            style: TextConstants.kMainTextStyle(),
                          ),
                          SizedBox(
                            width: 30.0,
                          ),
                          DropdownMenu(
                            hintText: '- Select -',
                            width: 190.0,
                            menuHeight: 150.0,
                            dropdownMenuEntries: kEmployeeRoles
                                .map<DropdownMenuEntry<String>>((String value) {
                              return DropdownMenuEntry<String>(
                                  value: value, label: value);
                            }).toList(),
                            onSelected: (String? selectedValue) {
                              _addEmpStateController.setRole(selectedValue!);
                            },
                            // initialSelection: roomTypeList.first
                          ),
                        ],
                      ),
                    ),
                    InputTextField(
                        title: 'NIC Number',
                        place_holder: 'Enter NIC',
                        submit_controller: _addEmpStateController.setNIC),
                    InputTextField(
                        title: 'Email Address',
                        place_holder: 'Enter email',
                        submit_controller: _addEmpStateController.setEmail),
                    InputTextField(
                        title: 'Phone Number',
                        place_holder: 'Enter phone number',
                        submit_controller:
                            _addEmpStateController.setPhoneNumber),
                    SizedBox(
                      height: 50.0,
                    ),
                  ],
                ),
              ),
              Center(
                  child: ButtonBlue(
                buttonText: 'Done',
                ontap: () async {
                  await _addEmpStateController.addEmployee();
                  Get.to(() => EmployeeScreen());
                },
                width: 100.0,
                textSize: 18.0,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
