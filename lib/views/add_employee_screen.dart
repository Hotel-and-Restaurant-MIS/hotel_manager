import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/components/button_blue.dart';
import 'package:hotel_manager_app/components/input_text_field.dart';
import 'package:hotel_manager_app/constants/employee_roles.dart';
import 'package:hotel_manager_app/constants/sub_title_text_style.dart';
import 'package:hotel_manager_app/models/form_valid_response.dart';
import 'package:hotel_manager_app/views/employee_screen.dart';
import '../controllers/views/add_employee_screen/add_emp_state_controller.dart';

class AddEmployeeScreen extends StatelessWidget {
  AddEmpStateController _addEmpStateController = AddEmpStateController.instance;

  @override
  Widget build(BuildContext context) {
    _addEmpStateController.resetData();
    return Scaffold(
        body: Stack(
      children: <Widget>[
        SafeArea(
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
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    children: [
                      InputTextField(
                          keyBoardType: TextInputType.name,
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
                                  .map<DropdownMenuEntry<String>>(
                                      (String value) {
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
                          keyBoardType: TextInputType.text,
                          title: 'NIC Number',
                          place_holder: 'Enter NIC',
                          submit_controller: _addEmpStateController.setNIC),
                      InputTextField(
                          keyBoardType: TextInputType.emailAddress,
                          title: 'Email Address',
                          place_holder: 'Enter email',
                          submit_controller: _addEmpStateController.setEmail),
                      InputTextField(
                          keyBoardType: TextInputType.phone,
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
                      FormValidResponse formValidResponse =
                          _addEmpStateController.validationForm();
                      if (formValidResponse.formValid) {
                        await _addEmpStateController.addEmployee();
                        Get.to(() => EmployeeScreen());
                      } else {
                        Get.dialog(
                          Dialog(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                border:
                                    Border.all(width: 2, color: Colors.blue),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, right: 8.0, left: 8.0),
                                    child: Text(
                                      '${formValidResponse.message}',
                                      style: TextStyle(
                                        fontSize: 19.0,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Close',
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    width: 100.0,
                    textSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
        Obx(
          () => _addEmpStateController.isEmployeeAdded.value
              ? Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      // child: CircularProgressIndicator(color: Colors.blue,),
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ),
      ],
    ));
  }
}
