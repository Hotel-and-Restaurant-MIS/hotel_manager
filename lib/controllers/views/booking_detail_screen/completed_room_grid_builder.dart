import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/components/room_tile.dart';

class CompletedRoomGridBuilder extends GetxController {
  static CompletedRoomGridBuilder instance = Get.find();

  Widget buildGridByRoomId(List<String> roomList) {
    List<Widget> children = [];
    print(' room list is :$roomList');
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
  // Widget buildGridByRoomId(List<String>? roomList) {
  //   if (roomList == null || roomList.isEmpty) {
  //     return Center(child: Text('No rooms available'));
  //   }
  //
  //   List<Widget> children = roomList.map((room) {
  //     return RoomTile(roomNumber: room);
  //   }).toList();
  //
  //   return CustomScrollView(
  //     slivers: <Widget>[
  //       SliverPadding(
  //         padding: const EdgeInsets.all(10),
  //         sliver: SliverGrid.count(
  //           crossAxisSpacing: 10,
  //           childAspectRatio: 90 / 30,
  //           mainAxisSpacing: 20,
  //           crossAxisCount: 2,
  //           children: children,
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
