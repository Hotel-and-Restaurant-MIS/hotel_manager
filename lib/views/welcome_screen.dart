import 'package:flutter/material.dart';
import 'package:hotel_manager_app/components/button_blue.dart';
import 'package:hotel_manager_app/constants/sub_title_text_style.dart';
import 'package:hotel_manager_app/views/review_management_screen.dart';
import 'booking_management_screen.dart';
import 'employee_screen.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40.0),
              Text(
                'Luxury',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Garamond',
                    fontSize: 45.0),
              ),
              Text(
                'Hotel',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Garamond',
                    fontSize: 45.0),
              ),
              SizedBox(height: 50.0),
              Image(
                image: AssetImage('images/Hotel Manager.png'),
                height: 200.0,
                width: 200.0,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 50.0),
              Text('Welcome, Manager !',style: TextConstants.kMainTextStyle(fontSize: 22.0),),
              SizedBox(
                height: 40.0,
              ),
              ButtonBlue(
                  buttonText: 'Booking Management Portal',
                  ontap: () {
                    Get.to(()=>BookingManagementScreen());
                  },
                  width: 300.0),
              SizedBox(
                height: 25.0,
              ),
              ButtonBlue(
                  buttonText: 'Employee Management Portal',
                  ontap: () {
                    Get.to(() => EmployeeScreen());
                  },
                  width: 300.0),
              SizedBox(
                height: 25.0,
              ),
              ButtonBlue(
                  buttonText: 'Review Management Portal',
                  ontap: () {
                    Get.to(() => ReviewManagementScreen());
                  },
                  width: 300.0),
            ],
          ),
        ),
      ),
    );
  }
}
