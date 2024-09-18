import 'package:flutter/material.dart';
import 'package:hotel_manager_app/constants/sub_title_text_style.dart';

class CustomerDetailTile extends StatelessWidget {
  String tileTile;
  String tileValue;

  CustomerDetailTile({required this.tileTile,required this.tileValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tileTile,
            style:
            TextConstants.kSubTextStyle(fontSize: 15.0),
          ),
          Text(
            tileValue,
            style:
            TextConstants.kMainTextStyle(fontSize: 15.0),
          ),
        ],
      ),
    );
  }
}
