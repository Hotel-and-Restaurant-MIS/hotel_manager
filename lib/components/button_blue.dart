import 'package:flutter/material.dart';

class ButtonBlue extends StatelessWidget {
  late String buttonText;
  final Function() ontap;
  double width;

  ButtonBlue(
      {required this.buttonText, required this.ontap, required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width,
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Barlow',
              fontSize:16.0,
              fontWeight: FontWeight.w700
            ),
                 ),
        ),
      ),
    );
  }
}
