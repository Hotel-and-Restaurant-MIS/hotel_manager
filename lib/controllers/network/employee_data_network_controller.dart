import 'dart:convert';

import 'package:get/get.dart';
import 'package:hotel_manager_app/constants/network_constants.dart';
import 'package:hotel_manager_app/exception/network_exception.dart';
import 'package:hotel_manager_app/models/employee.dart';
import 'package:http/http.dart' as http;

class EmployeeDataNetworkController extends GetxController {
  static EmployeeDataNetworkController instance = Get.find();

  Future<List<Map<String, dynamic>>> getEmployees() async {
    try{
      List<Map<String, dynamic>> currentEmployeeList = [];

      Uri uri = Uri.parse('${NetworkConstants.baseUrl}/employee/all');

      var response = await http.get(uri);

      if(response.statusCode == 200)
        {
          try{
            currentEmployeeList = response as List<Map<String, dynamic>>;
            return currentEmployeeList;
          }
          catch(e){
            //handle parse error
          }
        }
      else{
        throw NetworkException(message: 'Network Error due to : Status ${response.statusCode}, ${response.body}');
      }
      return currentEmployeeList;
    } catch(e){
      print('Error getting/parsing employee data');
      print(e.toString());
      throw NetworkException(message: e.toString());
    }
  }

  Future<Map<String, dynamic>> addEmploy({required Employee employee}) async {
    Map<String, dynamic> employeeMap = {};
    Uri url = Uri.parse('${NetworkConstants.baseUrl}/employee/add');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var employeeMap = jsonDecode(response.body) as Map<String, dynamic>;
      print('employee data have');
      return employeeMap;
    } else {
      print(
          'addEmploy Request failed with status: ${response.statusCode}.');
      throw NetworkException();
    }
  }
}
