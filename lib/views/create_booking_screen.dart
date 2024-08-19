import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/components/input_text_field.dart';
import 'package:hotel_manager_app/constants/sub_title_text_style.dart';
import 'package:hotel_manager_app/controllers/views/create_booking_screen/create_booking_state_controller.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:intl/intl.dart';

class CreateBookingScreen extends StatelessWidget {
  CreateBookingStateController _cbsc = CreateBookingStateController.instance;

  List<String> roomTypeList = ['Deluxe', 'Suite', 'Presidential suite'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            right: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Create Booking',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontFamily: 'Barlow',
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InputTextField(
                keyBoardType: TextInputType.name,
                  title: 'Name',
                  place_holder: 'Enter full name',
                  submit_controller: _cbsc.setName),
              InputTextField(
                keyBoardType: TextInputType.emailAddress,
                  title: 'Email address',
                  place_holder: 'Enter email',
                  submit_controller: _cbsc.setEmail),
              InputTextField(
                keyBoardType: TextInputType.phone,
                  title: 'Phone number',
                  place_holder: 'Enter phone number',
                  submit_controller: _cbsc.setPhoneNumber),
              InputTextField(
                  title: 'NIC number',
                  place_holder: 'Enter NIC number',
                  submit_controller: _cbsc.setNIC),
              InputTextField(
                keyBoardType: TextInputType.number,
                  title: 'No of rooms',
                  place_holder: 'Enter count',
                  submit_controller: _cbsc.setNoOfRooms),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: double.infinity,
                  // decoration: BoxDecoration(color: Colors.orange),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Select dates',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Barlow',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: <Widget>[],
                                  ),
                                  if (_cbsc.days!.isNotEmpty)
                                    Text(
                                      'Arrival date        :   ${DateFormat('yyyy/MM/dd').format(_cbsc.days![0])}',
                                      style: TextConstants.kSubTextStyle(
                                          textColour: Colors.black87),
                                    ),
                                  (_cbsc.days!.length > 1)
                                      ? Text(
                                          'Departure date :   ${DateFormat('yyyy/MM/dd').format(_cbsc.days![1])}',
                                          style: TextConstants.kSubTextStyle(
                                              textColour: Colors.black87),
                                        )
                                      : Text(
                                          'Select departure date !',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 15.0),
                                        ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              var results = await showCalendarDatePicker2Dialog(
                                context: context,
                                config:
                                    CalendarDatePicker2WithActionButtonsConfig(
                                  calendarType: CalendarDatePicker2Type.range,
                                ),
                                dialogSize: const Size(
                                    325, 400), // Custom size of dialog
                                value: _cbsc.days!,
                                borderRadius: BorderRadius.circular(15),
                              );

                              if (results != null && results.isNotEmpty) {
                                _cbsc.setDays(
                                    results.whereType<DateTime>().toList());
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Icon(
                                Icons.calendar_month_outlined,
                                size: 45.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15.0,bottom: 8.0,top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Room Type',style: TextConstants.kMainTextStyle(),),
                    SizedBox(width: 30.0,),
                    DropdownMenu(

                      hintText: '- Select -',
                      width: 150.0,
                      menuHeight: 150.0,
                      dropdownMenuEntries:
                          roomTypeList.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(value: value, label: value);
                      }).toList(),
                      // initialSelection: roomTypeList.first
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 15.0),
                child: Text('Rooms',style: TextConstants.kMainTextStyle(),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
