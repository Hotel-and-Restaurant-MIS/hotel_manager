import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/components/button_blue.dart';
import 'package:hotel_manager_app/components/customer_detail_tile.dart';
import 'package:hotel_manager_app/components/loading_dialog.dart';
import 'package:hotel_manager_app/components/view_booking_item_tile.dart';
import 'package:hotel_manager_app/constants/sub_title_text_style.dart';
import 'package:hotel_manager_app/controllers/views/booking_detail_screen/booking_detail_state_controller.dart';
import 'package:hotel_manager_app/controllers/views/booking_detail_screen/completed_room_grid_builder.dart';
import 'package:hotel_manager_app/models/booking.dart';
import 'package:hotel_manager_app/views/booking_management_screen.dart';
import 'package:intl/intl.dart';

class BookingDetailScreen extends StatelessWidget {
  Booking booking;
  bool isCompleted;

  BookingDetailStateController _bdsc = BookingDetailStateController.instance;

  CompletedRoomGridBuilder _rgb = CompletedRoomGridBuilder.instance;

  BookingDetailScreen({required this.booking, required this.isCompleted}) {}

  @override
  Widget build(BuildContext context) {
    _bdsc.resetData();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (isCompleted) ? 'Booking Details' : 'Reservation Details',
          style: TextConstants.kMainTextStyle(
              fontSize: 28.0, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '#${booking.bookingId}',
                  style: TextConstants.kMainTextStyle(
                      fontSize: 28.0, fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  'Customer Details',
                                  style: TextConstants.kSubTextStyle(
                                      fontSize: 20.0),
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Obx(
                                () => GestureDetector(
                                  onTap: _bdsc.changeVisibility,
                                  child: (_bdsc.isVisible)
                                      ? Transform.rotate(
                                          angle: 3.14, // 180 degrees in radians
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 3.0, bottom: 3.0),
                                            child: Icon(
                                              Icons.expand_circle_down_outlined,
                                              size: 30.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              top: 3.0, bottom: 3.0),
                                          child: Icon(
                                            Icons.expand_circle_down_outlined,
                                            size: 30.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                ),
                              )
                            ],
                          ),
                          Obx(
                            () => Visibility(
                              visible: _bdsc.isVisible,
                              child: Column(
                                children: <Widget>[
                                  CustomerDetailTile(
                                      tileTile: 'Name',
                                      tileValue: booking.customerName),
                                  CustomerDetailTile(
                                      tileTile: 'Phone No',
                                      tileValue: booking.phoneNumber),
                                  CustomerDetailTile(
                                      tileTile: 'NIC Number',
                                      tileValue: booking.nicNumber),
                                  CustomerDetailTile(
                                      tileTile: 'Email Address',
                                      tileValue: booking.email),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ViewBookingItemTile(
                    tileName: 'Booking Status',
                    tileValue: booking.bookingStatus!),
                ViewBookingItemTile(
                    tileName: 'Room Type', tileValue: booking.roomType),
                ViewBookingItemTile(
                    tileName: 'Date of Arrival',
                    tileValue:
                        DateFormat('yyyy/MM/dd').format(booking.arrivalDate)),
                ViewBookingItemTile(
                    tileName: 'Date of Departure',
                    tileValue:
                        DateFormat('yyyy/MM/dd').format(booking.departureDate)),
                ViewBookingItemTile(
                    tileName: 'No of Days', tileValue: '${booking.noOfDays}'),
                ViewBookingItemTile(
                    tileName: 'Number of Rooms',
                    tileValue: '${booking.noOfRooms}'),
                Visibility(
                  visible: isCompleted,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              'Room Numbers',
                              style: TextConstants.kSubTextStyle(),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 80.0,
                            child: _rgb.buildGridByRoomId(booking.roomList),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (!isCompleted)
                  FutureBuilder<bool>(
                    future: _bdsc.checkAvailability(
                      noOfRooms: booking.noOfRooms,
                      arrivalDate: booking.arrivalDate,
                      departureDAte: booking.departureDate,
                      roomType: booking.roomType,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Text(
                              'Error occurred!',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 28.0),
                            ),
                          ),
                        );
                      }

                      if (snapshot.hasData) {
                        bool isAvailable = snapshot.data ?? false;
                        return Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Text(
                              isAvailable
                                  ? _bdsc.isAvailable
                                      ? 'Available!'
                                      : '${_bdsc.isAvailableRoomCount} are available!'
                                  : 'Unavailable!',
                              style: TextStyle(
                                color: isAvailable ? Colors.green : Colors.red,
                                fontSize: 28.0,
                              ),
                            ),
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                Visibility(
                  visible: !isCompleted,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.grey.withOpacity(0.2)),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Room Numbers',
                            style: TextConstants.kSubTextStyle(),
                          ),
                          Obx(
                            () {
                              List<String> roomList = _bdsc.availableRoomList;
                              return Container(
                                width: double.infinity,
                                height: 80.0,
                                child: _rgb.buildGridByRoomId(roomList),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ViewBookingItemTile(
                    tileName: 'Amount', tileValue: '${booking.totalAmount}'),
                SizedBox(
                  height: 20.0,
                ),
                Visibility(
                    visible: !isCompleted,
                    child: Column(
                      children: [
                        Center(
                          child: ButtonBlue(
                              buttonText: 'Confirm Reservation',
                              ontap: () async {
                                LoadingDialog(
                                  callerFunction: () async {
                                    await _bdsc.addBooking(booking);
                                    await _bdsc
                                        .removeReservation(booking.bookingId!);
                                  },
                                  onErrorCallBack: (e) {
                                    print(e.toString());
                                  },
                                );
                                Get.back();
                                print('reserve button pressed');
                              },
                              width: 150.0),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Cancel Reservation',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
