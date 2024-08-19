import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_manager_app/constants/sub_title_text_style.dart';
import 'package:hotel_manager_app/controllers/views/add_employee_screen/add_emp_state_controller.dart';

class InputTextField extends StatelessWidget {
  TextEditingController _textFieldController = TextEditingController();
  final String title;
  final String place_holder;
  final Function(String) submit_controller;
  final TextInputType keyBoardType;

  InputTextField({
    required this.title,
    required this.place_holder,
    required this.submit_controller,
    this.keyBoardType=TextInputType.name
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0,top: 15.0,bottom: 15.0),
      child: Container(
        height: 80.0,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextConstants.kMainTextStyle(),
              ),
              TextField(
                keyboardType: keyBoardType,
                decoration: InputDecoration(
                  hintText: place_holder,
                  hintStyle: TextConstants.kSubTextStyle(fontSize: 17.0),
                ),
                controller: _textFieldController,
                onSubmitted: submit_controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
