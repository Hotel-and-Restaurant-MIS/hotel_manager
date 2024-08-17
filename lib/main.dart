import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/views/loading_screen.dart';
import 'package:hotel_manager_app/views/welcome_screen.dart';

void main() {
  runApp(hotel_manager_app());
}

class hotel_manager_app extends StatelessWidget {
  const hotel_manager_app({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    home: LoadingScreen(),
    );
  }
}
