import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/components/review_tile.dart';
import 'package:hotel_manager_app/controllers/data/review_data_controller.dart';
import 'package:hotel_manager_app/views/review_details_screen.dart';


class ReviewListBuilder extends GetxController{

  static ReviewListBuilder instance = Get.find();

  ReviewDataController _rdc = ReviewDataController.instance;

  Widget buildListByStatus({required String status}) {
    // Use _bdc.isGettingBookings to control loading animation
    return Obx(() {
      if (_rdc.isGettingReviews) {
        // Show loading animation while bookings are being fetched
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                color: Colors.blue,
              ),
              SizedBox(width: 30.0,),
              Text(
                'Loading...',
                style: TextStyle(fontSize: 20.0, color: Colors.blue),
              ),
            ],
          ),
        );
      } else if (_rdc.reviewDataMap[status] == null ||
          _rdc.reviewDataMap[status]!.isEmpty) {
        // Show message if no bookings are found after loading
        return Center(
          child: Text(
            'No $status booking',
            style: TextStyle(color: Colors.black38, fontSize: 20.0),
          ),
        );
      } else {
        // Show booking list once data is loaded
        List<Widget> children = _rdc.reviewDataMap[status]!.map((review) {
          return ReviewTile(
            reviewId: review.reviewId,
            customerName: review.customerName,
            onTap: () {
              if (review.reviewStatus == 'Pending') {
                Get.to(() => ReviewDetailsScreen(
                  review: review,
                  isApproved: false,
                ));
              } else if (review.reviewStatus == 'Approved') {
                Get.to(() => ReviewDetailsScreen(
                  review: review,
                  isApproved: true,
                ));
              } else {
                print('Error Occurs, booking status mismatch!');
              }
            },
          );
        }).toList();

        return CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(15.0),
              sliver: SliverList.list(
                children: children,
              ),
            ),
          ],
        );
      }
    });
  }
}