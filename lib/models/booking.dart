class Booking {
  String customerName;
  String phoneNumber;
  String nicNumber;
  String email;
  String bookingStatus;
  int bookingId;
  String roomType;
  int noOfRooms;
  int noOfDays;
  DateTime arrivalDate;
  DateTime departureDate;
  double totalAmount;
  List<String> roomList;

  Booking(
      {required this.customerName,
      required this.phoneNumber,
      required this.nicNumber,
      required this.email,
      required this.bookingStatus,
      required this.bookingId,
      required this.roomType,
      required this.noOfRooms,
      required this.noOfDays,
      required this.arrivalDate,
      required this.departureDate,
      required this.totalAmount,
      required this.roomList});

  factory Booking.fromMap(Map<String, dynamic> map) {
    DateTime checkInDay = DateTime.parse(map['checkinDate']);
    DateTime checkOutDay = DateTime.parse(map['checkoutDate']);
    int noOfDays = checkOutDay.difference(checkInDay).inDays;


    return Booking(
        customerName: map['customer']['name'],
        phoneNumber: map['customer']['phone'],
        nicNumber: map['customer']['nic'],
        email: map['customer']['email'],
        bookingId: map['bookingID'] ??map['reservationID'],
        bookingStatus: map['status'] ,
        roomType: map['roomTypeName'],
        noOfRooms: map['roomQuantity'],
        noOfDays: noOfDays,
        arrivalDate: DateTime.parse(map['checkinDate']),
        departureDate: DateTime.parse(map['checkoutDate']),
        totalAmount: map['totalPrice'],
        roomList: List<String>.from(map['reservedRoomsNumbers']??[]));
  }

  Map<String, dynamic> toMap() {
    return {
      'customerName': customerName,
      'phoneNumber': phoneNumber,
      'nicNumber': nicNumber,
      'email': email,
      'bookingStatus': bookingStatus,
      'bookingId': bookingId,
      'roomType': roomType,
      'noOfRooms': noOfRooms,
      'noOfDays': noOfDays,
      'arrivalDate': arrivalDate,
      'departureDate': departureDate,
      'totalAmount': totalAmount,
      'roomList': roomList,
    };
  }
}
