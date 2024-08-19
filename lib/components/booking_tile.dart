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
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 8.0, right: 8.0, top: 12.0, bottom: 12.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
            color: Colors.black12,
            width: 1.0,
          )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      bookingId,
                      style: TextConstants.kMainTextStyle(
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      nic,
                      style: TextConstants.kSubTextStyle(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  DateFormat('yyyy/MM/dd').format(arrivalDate),
                  style: TextConstants.kMainTextStyle(),
                ),
              ),
              // SizedBox(width: 5.0,),
            ],
          ),
        ),
      ),
    );
  }
}
