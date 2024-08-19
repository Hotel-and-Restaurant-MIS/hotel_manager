import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/components/room_tile.dart';
import 'package:hotel_manager_app/controllers/data/create_booking_data_controller.dart';

class RoomGridBuilder extends GetxController {
  static RoomGridBuilder instance = Get.find();

  CreateBookingDataController _cbdc = CreateBookingDataController.instance;

  Widget buildGridByRoomId() {
    List<Widget> children = [];
    _cbdc.roomList.forEach((room) {
      children.add(RoomTile(roomNumber: room));
      print('grid ${_cbdc.roomList}');
    });

    return CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              childAspectRatio: 100/40,
              mainAxisSpacing: 20,
              crossAxisCount: 3,
              children: children,
            ),
          ),
        ],
      );

  }
}
