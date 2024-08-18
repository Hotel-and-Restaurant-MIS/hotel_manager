import 'package:flutter/material.dart';
import 'package:hotel_manager_app/constants/sub_title_text_style.dart';
import 'package:intl/intl.dart';

class BookingTile extends StatelessWidget {
  String bookingId;
  String nic;
  DateTime arrivalDate;
  Function() onTap;

  BookingTile(
      {required this.bookingId,
      required this.nic,
      required this.arrivalDate,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  bookingId,
                  style: TextConstants.kMainTextStyle(),
                ),
                Text(
                  nic,
                  style: TextConstants.kSubTextStyle(),
                ),
              ],
            ),
            Text(
              DateFormat('yyyy/MM/dd').format(arrivalDate),
              style: TextConstants.kMainTextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
