import 'package:flutter/material.dart';
import 'package:hotel_manager_app/constants/sub_title_text_style.dart';

class ViewBookingItemTile extends StatelessWidget {
  String tileName;
  String tileValue;

  ViewBookingItemTile({required this.tileName, required this.tileValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  tileName,
                  style: TextConstants.kSubTextStyle(),
                ),
                Text(
                  tileValue,
                  style: TextConstants.kMainTextStyle(),
                ),
              ],
            ),
          )),
    );
  }
}
