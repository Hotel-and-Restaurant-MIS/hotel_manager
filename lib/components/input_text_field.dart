import 'package:flutter/material.dart';
import 'package:hotel_manager_app/constants/sub_title_text_style.dart';
import 'package:hotel_manager_app/controllers/views/add_employee_screen/add_emp_state_controller.dart';

class InputTextField extends StatelessWidget {
  TextEditingController _textFieldController = TextEditingController();
  final String title;
  final String place_holder;
  final Function(String) submit_controller;

  InputTextField({
    required this.title,
    required this.place_holder,
    required this.submit_controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 100.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextConstants.kMainTextStyle(),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: place_holder,
                hintStyle: TextConstants.kSubTextStyle(),
              ),
              controller: _textFieldController,
              onSubmitted: submit_controller,
            ),
          ],
        ),
      ),
    );
  }
}
