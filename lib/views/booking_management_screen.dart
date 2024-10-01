import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/constants/booking_status_constants.dart';
import 'package:hotel_manager_app/controllers/views/booking_management_screen/booking_list_builder.dart';
import 'package:hotel_manager_app/views/available_room_screen.dart';
import 'package:hotel_manager_app/views/create_booking_screen.dart';

class BookingManagementScreen extends StatelessWidget {
  const BookingManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        double deviceWidth = MediaQuery.of(context).size.width;
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(right: 20.0, bottom: 20.0),
              child: FloatingActionButton(
                backgroundColor: Color(0xFFC0D6E8),
                splashColor: Colors.grey,
                child: Icon(
                  Icons.add,
                  size: 45.0,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Get.to(() => CreateBookingScreen());
                },
              ),
            ),
            appBar: AppBar(
              toolbarHeight: 60.0,
              title: Padding(
                padding: const EdgeInsets.only(
                  right: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Reservations',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontFamily: 'Barlow',
                          fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => AvailableRoomScreen());
                      },
                      child: Icon(
                        Icons.event_available,
                        size: 40.0,
                        color: Colors.black,
                        shadows: [
                          BoxShadow(
                            offset: Offset(2.0, 2),
                            spreadRadius: 2.0,
                            blurRadius: 10.0,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              bottom: TabBar(
                splashBorderRadius: BorderRadius.circular(8.0),
                dividerHeight: 2.0,
                indicatorColor: Colors.blue,
                indicatorWeight: 3.0,
                labelColor: Colors.blue,
                isScrollable: true,
                tabs: kBookingStatusList.map<Widget>((status) {
                  return Tab(
                    child: Container(
                      width: deviceWidth * 0.3,
                      child: Center(
                        child: Text(
                          status,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            body: TabBarView(
              children: kBookingStatusList
                  .map<Widget>(
                    (status) => BookingListBuilder.instance
                        .buildListByStatus(status: status),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
