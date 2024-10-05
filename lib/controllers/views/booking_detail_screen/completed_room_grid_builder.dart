import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/components/room_tile.dart';

class CompletedRoomGridBuilder extends GetxController {
  static CompletedRoomGridBuilder instance = Get.find();

  Widget buildGridByRoomId(List<String> roomList) {
    List<Widget> children = [];
    print('rooms length in grid builder: $roomList');
    roomList.forEach((room) {
      children.add(RoomTile(roomNumber: room));
    }
    );
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            childAspectRatio: 90 / 30,
            mainAxisSpacing: 20,
            crossAxisCount: 4,
            children: children,
          ),
        ),
      ],
    );
  }
}
