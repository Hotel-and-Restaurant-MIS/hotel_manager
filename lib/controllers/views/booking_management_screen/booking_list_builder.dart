import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/components/booking_tile.dart';
import 'package:hotel_manager_app/controllers/data/booking_data_controller.dart';
import 'package:hotel_manager_app/views/completed_booking_screen.dart';
import 'package:hotel_manager_app/views/ongoing_booking_screen.dart';

class BookingListBuilder extends GetxController {
  static BookingListBuilder instance = Get.find();

  BookingDataController _bdc = BookingDataController.instance;

  Widget buildListByStatus({required String status}) {
    List<Widget> children = [];
    _bdc.bookingDataMap[status]!.forEach((booking) {
      children.add(BookingTile(
        bookingId: booking.bookingId,
        nic: booking.nicNumber,
        arrivalDate: booking.arrivalDate,
        onTap: () {
          if(booking.bookingStatus =='Ongoing'){
            Get.to(()=>OngoingBookingScreen());
          }else if(booking.bookingStatus=='Completed'){
            Get.to(()=> CompletedBookingScreen());
          }else{
            print('Error Occurs, booking status miss match! ');
          }
        },
      ));
    });
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(padding: const EdgeInsets.all(15.0),
        sliver: SliverList.list(
          children: children,
        ),
        ),
      ],
    );
  }
}
