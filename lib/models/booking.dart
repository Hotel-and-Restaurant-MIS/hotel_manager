class Booking {
  String customerName;
  String phoneNumber;
  String nicNumber;
  String email;
  String bookingStatus;
  String bookingId;
  String roomType;
  int noOfRooms;
  int noOfDays;
  DateTime arrivalDate;
  DateTime depatureDate;
  double totalAmount;

  Booking(
      {required this.customerName,
      required this.phoneNumber,
      required this.nicNumber,
      required this.email,
      required this.bookingStatus,
      this.bookingId = '001',
      required this.roomType,
      required this.noOfRooms,
      required this.noOfDays,
      required this.arrivalDate,
      required this.depatureDate,
      required this.totalAmount});

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
        customerName: map['customerName'],
        phoneNumber: map['phoneNumber'],
        nicNumber: map['nicNumber'],
        email: map['email'],
        bookingId: map['bookingId'] ,
        bookingStatus: map['bookingStatus'],
        roomType: map['roomType'],
        noOfRooms: map['noOfRooms'],
        noOfDays: map['noOfDays'],
        arrivalDate: map['arrivalDate'],
        depatureDate: map['departureDate'],
        totalAmount: map['totalAmount']);
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
      'departureDate': depatureDate,
      'totalAmount': totalAmount,

    };
  }
}
