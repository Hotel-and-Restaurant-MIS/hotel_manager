import 'package:flutter/material.dart';
import 'package:hotel_manager_app/components/button_blue.dart';
import 'booking_management_screen.dart';
import 'employee_screen.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
              SizedBox(height: 80.0),
              Image(
                image: AssetImage('images/Hotel Manager.png'),
                height: 250.0,
                width: 250.0,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 50.0),
              Text(
                'Luxury',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Garamond',
                    fontSize: 45.0),
              ),
              Text(
                'Restaurant',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Garamond',
                    fontSize: 45.0),
              ),
              SizedBox(
                height: 70.0,
              ),
              ButtonBlue(
                  buttonText: 'Booking Management Portal',
                  ontap: () {
                    Get.to(()=>BookingManagementScreen());
                  },
                  width: 300.0),
              SizedBox(
                height: 20.0,
              ),
              ButtonBlue(
                  buttonText: 'Employee Management Portal',
                  ontap: () {
                    Get.to(() => EmployeeScreen());
                  },
                  width: 300.0),
            ],
          ),
        ),
      ),
    );
  }
}
