import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/constants/sub_title_text_style.dart';
import 'package:hotel_manager_app/models/employee.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SingleEmployeeScreen extends StatelessWidget {
  final Employee employee;

  SingleEmployeeScreen({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: Icon(Icons.arrow_back,size: 30.0,),
                          onTap: (){
                            Get.back();
                          },
                        ),
                        SizedBox(
                          width: 40.0,
                        ),
                        Center(
                          child: Text(
                            employee.name,
                            style: TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Icon(Icons.account_circle_sharp,size: 200.0,color: Colors.black45,),
                  //   Image.network(employee.image_url),
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Role',
                    style: TextConstants.kMainTextStyle(
                      fontSize: 21.0,
                    ),
                  ),
                  Text(
                    employee.role!,
                    style: TextConstants.kSubTextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    height: 1.0,
                    decoration: BoxDecoration(color: Colors.black12),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Email Address',
                    style: TextConstants.kMainTextStyle(
                      fontSize: 21.0,
                    ),
                  ),
                  Text(
                    employee.email,
                    style: TextConstants.kSubTextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    height: 1.0,
                    decoration: BoxDecoration(color: Colors.black12),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Phone Number',
                    style: TextConstants.kMainTextStyle(
                      fontSize: 21.0,
                    ),
                  ),
                  Text(
                    employee.phone_no,
                    style: TextConstants.kSubTextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    height: 1.0,
                    decoration: BoxDecoration(color: Colors.black12),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'NIC Number',
                    style: TextConstants.kMainTextStyle(
                      fontSize: 21.0,
                    ),
                  ),
                  Text(
                    employee.nic,
                    style: TextConstants.kSubTextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    height: 1.0,
                    decoration: BoxDecoration(color: Colors.black12),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
