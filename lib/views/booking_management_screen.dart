import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/components/booking_status.dart';
import 'package:hotel_manager_app/controllers/views/booking_management_screen/booking_list_builder.dart';
import 'package:hotel_manager_app/views/create_booking_screen.dart';

class BookingManagementScreen extends StatelessWidget {
  const BookingManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        double deviceWidth = MediaQuery.of(context).size.width;
        double deviceHeight = MediaQuery.of(context).size.height;
        return DefaultTabController(
          length: 2,
          child: Scaffold(
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
                        Get.to(() => CreateBookingScreen());
                      },
                      child: Icon(
                        Icons.add,
                        size: 35.0,
                        color: Colors.black,
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
                        .buildListByStatus( status: status),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
