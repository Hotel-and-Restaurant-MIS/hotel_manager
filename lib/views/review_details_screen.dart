import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/components/button_blue.dart';
import 'package:hotel_manager_app/constants/sub_title_text_style.dart';
import 'package:hotel_manager_app/controllers/views/review_details_screen/review_details_state_controller.dart';
import 'package:hotel_manager_app/models/review.dart';

class ReviewDetailsScreen extends StatelessWidget {
  Review review;
  bool isApproved;

  ReviewDetailsScreen({required this.review, required this.isApproved});
  ReviewDetailsStateController _rdsc = ReviewDetailsStateController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 32.0, // Increase the size here
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 5.0,
        shadowColor: Colors.blue.withOpacity(0.3),
        backgroundColor: Colors.blue.withOpacity(0.1),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text(
                (isApproved) ? 'Approved Reviews' : 'Pending Reviews',
                style: TextConstants.kMainTextStyle(
                    fontSize: 28.0, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Review No :',
                    style: TextConstants.kMainTextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      ' ${review.reviewId}',
                      style: TextConstants.kSubTextStyle(
                        fontSize: 20.0,
                        textColour: Colors.black45,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Customer Name :',
                    style: TextConstants.kMainTextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      review.customerName,
                      style: TextConstants.kSubTextStyle(
                        fontSize: 20.0,
                        textColour: Colors.black45,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Review:',
                    style: TextConstants.kMainTextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      review.reviewBody,
                      style: TextConstants.kSubTextStyle(
                        fontSize: 20.0,
                        textColour: Colors.black45,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  Visibility(
                    visible: !isApproved,
                    child: Column(
                      children: [
                        Center(
                          child: ButtonBlue(
                            buttonText: 'Approve Review',
                            ontap: () async {
                              await _rdsc.approveReview(review.reviewId);
                              Get.back();
                            },
                            width: 180.0,
                            textSize: 18.0,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await _rdsc.removeReview(review.reviewId);
                            Get.back();
                          },
                          child: Container(
                            width: 180.0,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(
                                      0.5), // Adjust color opacity for desired light shadow effect
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(
                                      -2, -2), // Horizontal and vertical shifts
                                ),
                                BoxShadow(
                                  color: Colors.red[800]!.withOpacity(
                                      0.5), // Adjust color opacity for desired dark shadow effect
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(
                                      2, 2), // Horizontal and vertical shifts
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Remove Review',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
