class RoomType {
  final String roomTypeName;
  final int availableCount;

  RoomType({required this.roomTypeName, required this.availableCount});

  factory RoomType.fromMap(Map<String, dynamic> map) {
    return RoomType(
        roomTypeName: map['roomTypeName'],
        availableCount: map['availableCount']);
  }
}
