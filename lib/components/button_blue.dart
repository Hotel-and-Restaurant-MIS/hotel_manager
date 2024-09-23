import 'package:flutter/material.dart';

class ButtonBlue extends StatelessWidget {
  late String buttonText;
  final Function() ontap;
  double width;
  double? textSize = 16.0;

  ButtonBlue(
      {required this.buttonText,
      required this.ontap,
      required this.width,
      this.textSize});

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
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(
                  0.5), // Adjust color opacity for desired light shadow effect
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(-2, -2), // Horizontal and vertical shifts
            ),
            BoxShadow(
              color: Colors.blue[800]!.withOpacity(
                  0.5), // Adjust color opacity for desired dark shadow effect
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(2, 2), // Horizontal and vertical shifts
            ),
          ],
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Barlow',
                fontSize: textSize,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
