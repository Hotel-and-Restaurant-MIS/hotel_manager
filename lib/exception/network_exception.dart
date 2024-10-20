import 'package:hotel_manager_app/exception/base_exception.dart';

class NetworkException extends BaseException{
  NetworkException({String? message}) : super(message: message);

  @override
  String toString() {
    return message ?? super.toString();
  }
}