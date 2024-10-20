import 'package:flutter/material.dart';
import 'package:hotel_manager_app/components/button_blue.dart';
import 'package:hotel_manager_app/constants/sub_title_text_style.dart';
import 'package:hotel_manager_app/controllers/data/login_data_controller.dart';
import 'package:hotel_manager_app/controllers/views/login_screen/login_state_controller.dart';
import 'package:get/get.dart';
import 'package:hotel_manager_app/views/welcome_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginStateController _lsc = LoginStateController.instance;
  LoginDataController _ldc = LoginDataController.instance;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    'Luxury',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Garamond',
                        fontSize: 45.0),
                  ),
                ),
                Text(
                  'Hotel',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Garamond',
                      fontSize: 45.0),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Image(
                  image: AssetImage('images/Hotel Manager.png'),
                  height: 180.0,
                  width: 180.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 60.0,
                ),
                Text(
                  'Manager Login',
                  style: TextConstants.kSubTextStyle(
                    textColour: Colors.black,
                    fontSize: 23.0,
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: SizedBox(
                    width: 250.0,
                    height: 45.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        // obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'User Name',
                          hintStyle:
                              TextConstants.kSubTextStyle(fontSize: 17.0),
                        ),
                        controller: userNameController,
                        onChanged: (value) {
                          _lsc.setUserName(value);
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: SizedBox(
                    width: 250.0,
                    height: 45.0,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle:
                              TextConstants.kSubTextStyle(fontSize: 17.0),
                        ),
                        controller: passwordController,
                        onChanged: (value) {
                          _lsc.setPassword(value);
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Obx(
                  () => Visibility(
                    visible: !_ldc.isValidUser && _lsc.isSubmitted.value,
                    child: Text(
                      'Incorrect Password or User Name !',
                      style: TextConstants.kSubTextStyle(
                        textColour: Colors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 20.0),
                  child: ButtonBlue(
                      textSize: 20.0,
                      buttonText: 'Login',
                      ontap: () async {
                        await _lsc.checkUser();
                        _ldc.isValidUser
                            ? Get.to(() => WelcomeScreen())
                            : {
                                userNameController.clear(),
                                passwordController.clear(),
                              };
                      },
                      width: 150.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
