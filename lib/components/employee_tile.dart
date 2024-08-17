import 'package:flutter/material.dart';

class EmployeeTile extends StatelessWidget {
  final String name;
  final String role;
  final String id;
  final Function() onTap;

  EmployeeTile(
      {required this.name,
      required this.role,
      required this.id,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 90.0,
        width: 300.0,
        child: Padding(
          padding: const EdgeInsets.only(right: 25.0,left: 8.0,top: 8.0,bottom: 8.0,),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Barlow',
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        role,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Barlow',
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  Text(
                    id,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Barlow',
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.0,),
              Container(height: 1.0,decoration: BoxDecoration(color: Colors.grey),),
            ],

          ),
        ),
      ),
    );
  }
}
