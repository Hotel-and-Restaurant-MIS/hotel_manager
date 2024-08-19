import 'package:flutter/material.dart';

class RoomTile extends StatelessWidget {
  final String roomNumber;
  RoomTile({required this.roomNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 40.0,
      child: Text(
        roomNumber,
        style: TextStyle(color: Colors.blue, fontSize: 20.0),
      ),
    );
  }
}
