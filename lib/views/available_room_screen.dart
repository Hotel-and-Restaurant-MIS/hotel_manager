import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/constants/sub_title_text_style.dart';
import 'package:hotel_manager_app/controllers/data/available_rooms_data_controller.dart';
import 'package:hotel_manager_app/controllers/views/available_room_screen/available_room_state_controller.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AvailableRoomScreen extends StatelessWidget {
  AvailableRoomStateController _arsc = AvailableRoomStateController.instance;
  AvailableRoomsDataController _ardc = AvailableRoomsDataController.instance;
  @override
  Widget build(BuildContext context) {
    _arsc.resetData();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Available Rooms',
          style: TextConstants.kMainTextStyle(
              fontSize: 27.0, fontWeight: FontWeight.w700),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15.0, top: 15.0, bottom: 15.0),
                    child: Container(
                      width: double.infinity,
                      // decoration: BoxDecoration(color: Colors.orange),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Select dates',
                            style: TextStyle(
                              fontSize: 23.0,
                              fontFamily: 'Barlow',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Obx(
                                () => Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: <Widget>[],
                                      ),
                                      if (_arsc.days!.isNotEmpty)
                                        Column(
                                          children: [
                                            Text(
                                              'Arrival date        :   ${DateFormat('yyyy/MM/dd').format(_arsc.days![0])}',
                                              style:
                                                  TextConstants.kSubTextStyle(
                                                      textColour:
                                                          Colors.black87),
                                            ),
                                            SizedBox(
                                              height: 30.0,
                                            ),
                                          ],
                                        ),
                                      (_arsc.days!.length > 1)
                                          ? Text(
                                              'Departure date :   ${DateFormat('yyyy/MM/dd').format(_arsc.days![1])}',
                                              style:
                                                  TextConstants.kSubTextStyle(
                                                      textColour:
                                                          Colors.black87),
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
                                  var results =
                                      await showCalendarDatePicker2Dialog(
                                    context: context,
                                    config:
                                        CalendarDatePicker2WithActionButtonsConfig(
                                      selectedDayHighlightColor:
                                          Colors.blue.withOpacity(0.8),
                                      selectedRangeHighlightColor:
                                          Colors.blue.withOpacity(0.2),
                                      calendarType:
                                          CalendarDatePicker2Type.range,
                                    ),
                                    dialogSize: const Size(
                                        325, 400), // Custom size of dialog
                                    value: _arsc.days!,
                                    borderRadius: BorderRadius.circular(15),
                                  );

                                  if (results != null && results.isNotEmpty) {
                                    _arsc.setDays(
                                        results.whereType<DateTime>().toList());
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 15.0, top: 12.0),
                                  child: Icon(
                                    color: Colors.black,
                                    Icons.calendar_month_outlined,
                                    size: 50.0,
                                    shadows: [
                                      BoxShadow(
                                        offset: Offset(2.0, 2),
                                        spreadRadius: 2.0,
                                        blurRadius: 10.0,
                                        color: Colors.black38,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'Availability',
                    style: TextConstants.kMainTextStyle(fontSize: 24.0),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Single Room',
                          style: TextConstants.kMainTextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, top: 10.0),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0,
                                  bottom: 5.0,
                                  left: 15.0,
                                  right: 15.0),
                              child: Obx(
                                () => Text(
                                  '${_ardc.singleRoomCount} Available',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Double Room',
                          style: TextConstants.kMainTextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, top: 10.0),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0,
                                  bottom: 5.0,
                                  left: 15.0,
                                  right: 15.0),
                              child: Obx(
                                () => Text(
                                  '${_ardc.doubleRoomCount} Available',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Twin Room',
                          style: TextConstants.kMainTextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, top: 10.0),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0,
                                  bottom: 5.0,
                                  left: 15.0,
                                  right: 15.0),
                              child: Obx(
                                () => Text(
                                  '${_ardc.twinRoomCount} Available',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Obx(
            () => _arsc.isLoading.value
                ? Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Center(
                        // child: CircularProgressIndicator(color: Colors.blue,),
                        child: LoadingAnimationWidget.threeArchedCircle(
                          color: Colors.blue,
                          size: 50.0,
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
