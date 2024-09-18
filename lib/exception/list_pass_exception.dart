import 'package:hotel_manager_app/exception/base_exception.dart';

class ListPassException extends BaseException{
  ListPassException({String? message}) : super(message: message);

  @override
  String toString() {
    // TODO: implement toString
    return message ?? super.toString();
  }
}