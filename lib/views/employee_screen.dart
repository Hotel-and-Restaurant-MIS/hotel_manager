import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/controllers/views/employee_screen/employee_list_builder.dart';
import 'package:hotel_manager_app/views/add_employee_screen.dart';
import 'package:hotel_manager_app/views/welcome_screen.dart';

class EmployeeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 20.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Icon(Icons.arrow_back,size: 30.0,),
                    onTap: (){
                      Get.to(()=>WelcomeScreen());
                    },
                  ),
                  Expanded(
                    child: Center(
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
                  ),
                  SizedBox(width: 50.0,),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Expanded(
                child: EmployeeListBuilder().buildEmployeeList(),
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: GestureDetector(
                        onTap: (){
                          Get.to(()=>AddEmployeeScreen());
                        },
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
                    ),
                  ),
                  SizedBox(width: 25.0,),
                ],
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
