import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/components/room_tile.dart';
import 'package:hotel_manager_app/controllers/data/create_booking_data_controller.dart';

class RoomGridBuilder extends GetxController {
  static RoomGridBuilder instance = Get.find();

  CreateBookingDataController _cbdc = CreateBookingDataController.instance;

  Widget buildGridByRoomId() {
    bool firstTime = true;
    return Obx(
      () {
        List<Widget> children = [];
        _cbdc.availableRoomList.forEach((room) {
          children.add(RoomTile(roomNumber: room));
        });

        return _cbdc.isRoomsAvailable
            ? CustomScrollView(
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
              )
            : Obx(
                () => Center(
                  child: Text(
                    'Only ${_cbdc.availableRoomCount} rooms are available !',
                    style: TextStyle(
                      fontSize: 19.0,
                      color: Colors.red,
                    ),
                  ),
                ),
              );
      },
    );
  }
}
