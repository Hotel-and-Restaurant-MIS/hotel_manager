import 'package:get/get.dart';
import 'package:hotel_manager_app/controllers/network/available_room_network_controller.dart';
import 'package:hotel_manager_app/models/roomType.dart';


class AvailableRoomsDataController extends GetxController{

  static AvailableRoomsDataController instance = Get.find();

  AvailableRoomsNetworkController _arnc = AvailableRoomsNetworkController.instance;

  RxInt _singleRoomCount = 0.obs;
  RxInt _doubleRoomCount = 0.obs;
  RxInt _twinRoomCount = 0.obs;

  int? get singleRoomCount => _singleRoomCount.value;
  int? get doubleRoomCount => _doubleRoomCount.value;
  int? get twinRoomCount => _twinRoomCount.value;

  void setSingleRoomCount(int value) {
    _singleRoomCount.value = value;
    update();
  }

  void setDoubleRoomCount(int value) {
    _doubleRoomCount.value = value;
    update();
  }

  void setTwinRoomCount(int value) {
    _twinRoomCount.value = value;
    update();
  }

  Future<void> getAvailableRoomCount({
    required List<DateTime> dateList,
  }) async {
    List<RoomType> roomTypeCountList =[];
    try{
      List<Map<String, dynamic>> roomCountMapList = await _arnc.getAvailableRoomCount(dateList: dateList);
      roomCountMapList.forEach((Map<String, dynamic> roomTypeMap){
        roomTypeCountList.add(RoomType.fromMap(roomTypeMap));
      });
      for(RoomType roomType in roomTypeCountList){
        if(roomType.roomTypeName == 'SINGLE ROOM'){
          setSingleRoomCount(roomType.availableCount);
        }else if(roomType.roomTypeName == 'DOUBLE ROOM'){
          setDoubleRoomCount(roomType.availableCount);
        }else if(roomType.roomTypeName == 'TWIN ROOM'){
          setTwinRoomCount(roomType.availableCount);
        }
      }
      print('single Room: $_singleRoomCount');
    }catch(e){
      print('Error occurs getting available room count for all room type');
      print(e.toString());
    }
  }
  void resetData(){
    setTwinRoomCount(0);
    setDoubleRoomCount(0);
    setSingleRoomCount(0);
  }
}