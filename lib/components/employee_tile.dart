import 'package:flutter/material.dart';
import 'package:hotel_manager_app/constants/sub_title_text_style.dart';

class EmployeeTile extends StatelessWidget {
  final String name;
  final String role;
  final String id;
  final Function() onTap;

  EmployeeTile({
    required this.name,
    required this.role,
    required this.id,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 25.0, top: 15.0, bottom: 15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Set the background color of the tile to white
            border: Border.all(width: 1.0, color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              // Light shadow for a subtle top/left illumination
              BoxShadow(
                color: Colors.grey[200]!, // Light grey color for a softer shadow
                spreadRadius: 1,
                blurRadius: 6,
                offset: Offset(-4, -4), // positions the shadow to the top left
              ),
              // Dark shadow for a subtle bottom/right shadow
              BoxShadow(
                color: Colors.grey[350]!, // Darker grey color for a noticeable shadow
                spreadRadius: 1,
                blurRadius: 6,
                offset: Offset(4, 4), // positions the shadow to the bottom right
              ),
            ],
          ),
          height: 70.0,
          width: 300.0,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 25.0,
              left: 8.0,
              top: 8.0,
              bottom: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextConstants.kMainTextStyle(),
                    ),
                    Text(
                      role,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Barlow',
                        color: Colors.black45,
                      ),
                    )
                  ],
                ),
                Text(
                  id,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Barlow',
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
