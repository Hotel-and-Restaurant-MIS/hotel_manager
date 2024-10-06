class RoomType {
  final String roomTypeName;
  final int availableCount;
  final double roomPrice;

  RoomType({required this.roomTypeName, required this.availableCount, required this.roomPrice});

  factory RoomType.fromMap(Map<String, dynamic> map) {
    return RoomType(
        roomTypeName: map['roomTypeName'],
        availableCount: map['availableCount']??0,
        roomPrice: map['pricePerDay']?? 0.0
    );
  }
}
