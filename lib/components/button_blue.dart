import 'package:flutter/material.dart';

class ButtonBlue extends StatelessWidget {
  late String buttonText;
  final Function() ontap;
  double width;
  double? textSize = 16.0;

  ButtonBlue(
      {required this.buttonText, required this.ontap, required this.width, this.textSize});

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
              fontSize:textSize,
              fontWeight: FontWeight.w700
            ),
                 ),
        ),
      ),
    );
  }
}
