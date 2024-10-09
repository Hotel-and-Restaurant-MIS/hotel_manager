import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/constants/review_constants.dart';
import 'package:hotel_manager_app/controllers/views/review_screen/review_list_builder.dart';
import 'package:hotel_manager_app/controllers/views/review_screen/review_state_controller.dart';

class ReviewManagementScreen extends StatelessWidget {
  ReviewStateController _rsc = ReviewStateController.instance;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        double deviceWidth = MediaQuery.of(context).size.width;
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                iconSize: 32.0, // Increase the size here
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Get.back();
                },
              ),
              toolbarHeight: 60.0,
              title: Padding(
                padding: const EdgeInsets.only(
                  right: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Review Management',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontFamily: 'Barlow',
                          fontWeight: FontWeight.w700),
                    ),
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
                tabs: kReviewNames.map<Widget>((status) {
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
              children: kReviewNames
                  .map<Widget>(
                    (status) => ReviewListBuilder.instance
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
