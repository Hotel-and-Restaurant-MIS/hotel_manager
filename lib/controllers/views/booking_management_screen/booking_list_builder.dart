import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/components/booking_tile.dart';
import 'package:hotel_manager_app/controllers/data/booking_data_controller.dart';
import 'package:hotel_manager_app/views/booking_detail_screen.dart';
import 'package:hotel_manager_app/views/ongoing_booking_screen.dart';

class BookingListBuilder extends GetxController {
  static BookingListBuilder instance = Get.find();

  BookingDataController _bdc = BookingDataController.instance;

  Widget buildListByStatus({required String status}) {
    List<Widget> children = [];
    if (_bdc.bookingDataMap[status] == null || _bdc.bookingDataMap[status]!.isEmpty) {  //TODO: there is error when empty
      return Center(child: Text('No $status booking',style: TextStyle(color: Colors.black38,fontSize:20.0 ),));
    } else {
      _bdc.bookingDataMap[status]!.forEach((booking) {
        children.add(BookingTile(
          bookingId: booking.bookingId,
          nic: booking.nicNumber,
          arrivalDate: booking.arrivalDate,
          onTap: () {
            if (booking.bookingStatus == 'OnGoing') {
              Get.to(
                () => BookingDetailScreen(
                  booking: booking,
                  isCompleted: false,
                ),
              );
            } else if (booking.bookingStatus == 'Completed') {
              Get.to(
                () => BookingDetailScreen(
                  booking: booking,
                  isCompleted: true,
                ),
              );
            } else {
              print('Error Occurs, booking status miss match! ');
            }
          },
        ));
      });
      return CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(15.0),
            sliver: SliverList.list(
              children: children,
            ),
          ),
        ],
      );
    }
  }
}
