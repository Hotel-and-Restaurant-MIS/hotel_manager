import 'package:flutter/material.dart';
import 'package:hotel_manager_app/views/available_room_screen.dart';
import 'package:hotel_manager_app/views/create_booking_screen.dart';
import 'package:hotel_manager_app/views/welcome_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../controll_initializer.dart';

class LoadingScreen extends StatelessWidget {
  Future<String> initController() async {
    try {
      if (!ControllerInitializer.isInitialized) {
        await ControllerInitializer.initAllControllers();
      }
      return 'Init All Controllers.';
    } catch (e) {
      print("Error occurs Loading controllers.");
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initController(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return WelcomeScreen();
          } else if (snapshot.hasError) {
            return Scaffold(
              body: SafeArea(
                child: Center(
                  child: Text(
                    'An Unexpected error occurs.',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(
              body: SafeArea(
                child: Center(
                  child: LoadingAnimationWidget.threeArchedCircle(
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
              ),
            );
          }
        });
  }
}
