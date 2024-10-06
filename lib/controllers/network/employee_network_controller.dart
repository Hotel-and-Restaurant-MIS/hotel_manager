import 'dart:convert';

import 'package:get/get.dart';
import 'package:hotel_manager_app/constants/network_constants.dart';
import 'package:hotel_manager_app/exception/network_exception.dart';
import 'package:hotel_manager_app/models/employee.dart';
import 'package:http/http.dart' as http;

import '../../exception/list_pass_exception.dart';

class EmployeeDataNetworkController extends GetxController {
  static EmployeeDataNetworkController instance = Get.find();

  Future<List<Map<String, dynamic>>> getEmployees() async {
    try {
      List<Map<String, dynamic>> currentEmployeeList = [];

      Uri uri = Uri.parse('${NetworkConstants.baseUrl}/employee/all');

      var response = await http.get(uri);

      if (response.statusCode == 200) {
        try {
          var jsonResponse = jsonDecode(response.body) as List;
          currentEmployeeList = jsonResponse
              .map((employee) => employee as Map<String, dynamic>)
              .toList();
          return currentEmployeeList;
        } catch (e) {
          throw ListPassException(
              message: 'List Passing error at getting employee list ');
        }
      } else {
        throw NetworkException(
            message:
                'Network Error due to : Status ${response.statusCode}, ${response.body}');
      }
    } catch (e) {
      print('Error getting/parsing employee data');
      print(e.toString());
      throw NetworkException(message: e.toString());
    }
  }

  Future<Map<String, dynamic>> addEmploy({required Employee employee}) async {
    try{
      Uri url = Uri.parse('${NetworkConstants.baseUrl}/employee/add');

      var body = jsonEncode(employee.toMap());
      print(body.toString());

      var response = await http.post(url,
          headers: {
            'content-Type': 'application/json',
          },
          body: body);

      if (response.statusCode == 200) {
        Map<String, dynamic> employeeMap =
        jsonDecode(response.body) as Map<String, dynamic>;
        return employeeMap;
      } else {
        print('addEmploy Request failed with status: ${response.statusCode}.');
        throw NetworkException();
      }
    }catch(e){
      print('Error adding new employee');
      print(e.toString());
      throw NetworkException(message: e.toString());
    }
  }
}
