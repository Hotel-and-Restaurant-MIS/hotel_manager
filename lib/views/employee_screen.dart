import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/controllers/views/employee_screen/employee_list_builder.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 20.0),
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: Icon(Icons.arrow_back),
                onTap: (){
                  Get.back();
                },
              ),
              Center(
                child: Text(
                  'Employees',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Expanded(
                child: EmployeeListBuilder().buildEmployeeList(),
              ),
              SizedBox(height: 10.0,),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  height: 45.0,
                  width: 150.0,
                  child: Center(
                    child: Text(
                      'Add Employee',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Barlow',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
