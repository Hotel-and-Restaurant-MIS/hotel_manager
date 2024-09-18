import 'package:flutter/material.dart';
import 'package:hotel_manager_app/constants/sub_title_text_style.dart';
import 'package:intl/intl.dart';

class BookingTile extends StatelessWidget {
  int bookingId;
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
            ),
            gradient: LinearGradient(
              colors: [
                Colors.grey.withOpacity(0.2),
                Colors.grey.withOpacity(0.5)
              ], // Define gradient colors
              begin: Alignment.topLeft, // Start the gradient at the top left
              end:
                  Alignment.bottomRight, // End the gradient at the bottom right
            ),
            boxShadow: [
              BoxShadow(
                color:
                    Colors.grey.withOpacity(0.2), // Shadow color with opacity
                spreadRadius: 1, // How much the shadow spreads
                blurRadius: 3, // How blurry the shadow is
                offset: Offset(0, 3), // X and Y offsets of the shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '$bookingId',
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
