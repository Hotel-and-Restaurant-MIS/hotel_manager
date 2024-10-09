import 'package:flutter/material.dart';
import 'package:hotel_manager_app/constants/sub_title_text_style.dart';

class ReviewTile extends StatelessWidget {
  int reviewId;
  String customerName;
  Function() onTap;

  ReviewTile(
      {required this.customerName,
      required this.onTap,
      required this.reviewId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 8.0, right: 8.0, top: 12.0, bottom: 12.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.black12,
              width: 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color:
                    Colors.grey[200]!, // Light grey color for a softer shadow
                spreadRadius: 1,
                blurRadius: 6,
                offset: Offset(-4, -4), // positions the shadow to the top left
              ),
              BoxShadow(
                color: Colors
                    .grey[350]!, // Darker grey color for a noticeable shadow
                spreadRadius: 1,
                blurRadius: 6,
                offset:
                    Offset(4, 4), // positions the shadow to the bottom right
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0,right: 15.0,top: 15.0,bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$reviewId',
                  style:
                      TextConstants.kMainTextStyle(fontWeight: FontWeight.w700,fontSize: 23.0),
                ),
                SizedBox(width: 40.0,),
                Container(
                  child: Text(
                    customerName,
                    style: TextConstants.kSubTextStyle(fontSize: 20.0),
                  ),
                ),
                // SizedBox(width: 5.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

