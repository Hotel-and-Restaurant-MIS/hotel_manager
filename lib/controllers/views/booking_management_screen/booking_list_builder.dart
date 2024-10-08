import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/components/booking_tile.dart';
import 'package:hotel_manager_app/controllers/data/booking_data_controller.dart';
import 'package:hotel_manager_app/views/booking_detail_screen.dart';

class BookingListBuilder extends GetxController {
  static BookingListBuilder instance = Get.find();
  BookingDataController _bdc = BookingDataController.instance;

  Widget buildListByStatus({required String status}) {
    // Use _bdc.isGettingBookings to control loading animation
    return Obx(() {
      if (_bdc.isGettingBookings) {
        // Show loading animation while bookings are being fetched
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                color: Colors.blue,
              ),
              SizedBox(width: 30.0,),
              Text(
                'Loading...',
                style: TextStyle(fontSize: 20.0, color: Colors.blue),
              ),
            ],
          ),
        );
      } else if (_bdc.bookingDataMap[status] == null ||
          _bdc.bookingDataMap[status]!.isEmpty) {
        // Show message if no bookings are found after loading
        return Center(
          child: Text(
            'No $status booking',
            style: TextStyle(color: Colors.black38, fontSize: 20.0),
          ),
        );
      } else {
        // Show booking list once data is loaded
        List<Widget> children = _bdc.bookingDataMap[status]!.map((booking) {
          return BookingTile(
            bookingId: booking.bookingId!,
            nic: booking.nicNumber,
            arrivalDate: booking.arrivalDate,
            onTap: () {
              if (booking.bookingStatus == 'OnGoing') {
                Get.to(() => BookingDetailScreen(
                      booking: booking,
                      isCompleted: false,
                    ));
              } else if (booking.bookingStatus == 'Completed') {
                Get.to(() => BookingDetailScreen(
                      booking: booking,
                      isCompleted: true,
                    ));
              } else {
                print('Error Occurs, booking status mismatch!');
              }
            },
          );
        }).toList();

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
    });
  }
}
