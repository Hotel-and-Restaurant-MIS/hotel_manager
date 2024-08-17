import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/components/employee_tile.dart';
import 'package:hotel_manager_app/controllers/data/employee_data_controller.dart';

class EmployeeListBuilder extends GetxController {
  static EmployeeListBuilder instance = Get.find();

  EmployeeDataController _edc = EmployeeDataController.instance;

  Widget buildEmployeeList() {
    List employeeList = _edc.employeeList;
    List<Widget> children = [];

    if (employeeList.isEmpty) {
      return Center(child: Text('No Employees Availbale'));
    }
    _edc.employeeList.forEach((employee) {
      children.add(EmployeeTile(
          name: employee.name,
          role: employee.role,
          id: employee.id,
          onTap: () {}));
    });
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
            padding: const EdgeInsets.only(bottom: 30),
            sliver: SliverList.list(children: children))
      ],
    );
  }
}
