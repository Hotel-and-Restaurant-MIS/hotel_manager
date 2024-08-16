import 'package:flutter/material.dart';
import 'package:hotel_manager_app/components/button_blue.dart';

class welcome_screen extends StatelessWidget {
  const welcome_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.start,

            children: <Widget>[
              Image(
                image: AssetImage('images/hotelM.png'),
                height: 400.0,
                width: 400.0,
              ),
              Text(
                'Luxury',
                style: TextStyle(
                    color: Colors.black, fontFamily: 'Garamond', fontSize: 45.0),
              ),
              Text(
                'Restuarent',
                style: TextStyle(
                    color: Colors.black, fontFamily: 'Garamond', fontSize: 45.0),
              ),
              SizedBox(
                height: 30.0,
              ),
              ButtonBlue(
                  buttonText: 'Booking Management Portal',
                  ontap: () {},
                  width: 300.0),
              SizedBox(
                height: 20.0,
              ),
              ButtonBlue(
                  buttonText: 'Employee Management Portal',
                  ontap: () {},
                  width: 300.0),
            ],
          ),
        ),
      ),
    );
  }
}
