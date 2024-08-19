import 'package:flutter/material.dart';

class RoomTile extends StatelessWidget {
  final String roomNumber;
  RoomTile({required this.roomNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(5.0),),
      width: 20.0,
      height: 20.0,
      child: Center(
        child: Text(
          roomNumber,
          style: TextStyle(color: Colors.blue, fontSize: 20.0),
        ),
      ),
    );
  }
}
