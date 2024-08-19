import '../models/booking.dart';

List<Booking> kBookingList = [
  Booking(
    customerName: 'John Doe',
    phoneNumber: '0771234567',
    nicNumber: '123456789V',
    email: 'johndoe@gmail.com',
    bookingStatus: 'Ongoing',
    roomType: 'Deluxe',
    noOfRooms: 2,
    noOfDays: 3,
    arrivalDate: DateTime(2024, 3, 20), // 20/March/2024
    depatureDate: DateTime(2024, 3, 23), // 23/March/2024
    totalAmount: 1500.0,
  ),
  Booking(
    customerName: 'Jane Smith',
    phoneNumber: '0779876543',
    nicNumber: '987654321V',
    email: 'janesmith@gmail.com',
    bookingStatus: 'Completed',
    roomType: 'Standard',
    noOfRooms: 1,
    noOfDays: 5,
    arrivalDate: DateTime(2024, 4, 15), // 15/April/2024
    depatureDate: DateTime(2024, 4, 20), // 20/April/2024
    totalAmount: 2500.0,
  ),
  Booking(
    customerName: 'Robert Brown',
    phoneNumber: '0775678910',
    nicNumber: '112233445V',
    email: 'robertbrown@gmail.com',
    bookingStatus: 'Ongoing',
    roomType: 'Suite',
    noOfRooms: 3,
    noOfDays: 4,
    arrivalDate: DateTime(2024, 5, 10), // 10/May/2024
    depatureDate: DateTime(2024, 5, 14), // 14/May/2024
    totalAmount: 3200.0,
  ),
  Booking(
    customerName: 'Emily Johnson',
    phoneNumber: '0773344556',
    nicNumber: '556677889V',
    email: 'emilyjohnson@gmail.com',
    bookingStatus: 'Completed',
    roomType: 'Deluxe',
    noOfRooms: 2,
    noOfDays: 2,
    arrivalDate: DateTime(2024, 2, 25), // 25/February/2024
    depatureDate: DateTime(2024, 2, 27), // 27/February/2024
    totalAmount: 1800.0,
  ),
  Booking(
    customerName: 'David Wilson',
    phoneNumber: '0774455667',
    nicNumber: '667788990V',
    email: 'davidwilson@gmail.com',
    bookingStatus: 'Ongoing',
    roomType: 'Standard',
    noOfRooms: 1,
    noOfDays: 7,
    arrivalDate: DateTime(2024, 6, 5), // 05/June/2024
    depatureDate: DateTime(2024, 6, 12), // 12/June/2024
    totalAmount: 2100.0,
  ),
  Booking(
    customerName: 'John Doe',
    phoneNumber: '0771234567',
    nicNumber: '123456789V',
    email: 'johndoe@gmail.com',
    bookingStatus: 'Ongoing',
    roomType: 'Deluxe',
    noOfRooms: 2,
    noOfDays: 3,
    arrivalDate: DateTime(2024, 3, 20), // 20/March/2024
    depatureDate: DateTime(2024, 3, 23), // 23/March/2024
    totalAmount: 1500.0,
  ),
  Booking(
    customerName: 'Jane Smith',
    phoneNumber: '0779876543',
    nicNumber: '987654321V',
    email: 'janesmith@gmail.com',
    bookingStatus: 'Completed',
    roomType: 'Standard',
    noOfRooms: 1,
    noOfDays: 5,
    arrivalDate: DateTime(2024, 4, 15), // 15/April/2024
    depatureDate: DateTime(2024, 4, 20), // 20/April/2024
    totalAmount: 2500.0,
  ),
  Booking(
    customerName: 'Robert Brown',
    phoneNumber: '0775678910',
    nicNumber: '112233445V',
    email: 'robertbrown@gmail.com',
    bookingStatus: 'Ongoing',
    roomType: 'Suite',
    noOfRooms: 3,
    noOfDays: 4,
    arrivalDate: DateTime(2024, 5, 10), // 10/May/2024
    depatureDate: DateTime(2024, 5, 14), // 14/May/2024
    totalAmount: 3200.0,
  ),
  Booking(
    customerName: 'Emily Johnson',
    phoneNumber: '0773344556',
    nicNumber: '556677889V',
    email: 'emilyjohnson@gmail.com',
    bookingStatus: 'Completed',
    roomType: 'Deluxe',
    noOfRooms: 2,
    noOfDays: 2,
    arrivalDate: DateTime(2024, 2, 25), // 25/February/2024
    depatureDate: DateTime(2024, 2, 27), // 27/February/2024
    totalAmount: 1800.0,
  ),
  Booking(
    customerName: 'David Wilson',
    phoneNumber: '0774455667',
    nicNumber: '667788990V',
    email: 'davidwilson@gmail.com',
    bookingStatus: 'Ongoing',
    roomType: 'Standard',
    noOfRooms: 1,
    noOfDays: 7,
    arrivalDate: DateTime(2024, 6, 5), // 05/June/2024
    depatureDate: DateTime(2024, 6, 12), // 12/June/2024
    totalAmount: 2100.0,
  ),
  Booking(
    customerName: 'Sarah Davis',
    phoneNumber: '0779988776',
    nicNumber: '334455667V',
    email: 'sarahdavis@gmail.com',
    bookingStatus: 'Completed',
    roomType: 'Suite',
    noOfRooms: 3,
    noOfDays: 6,
    arrivalDate: DateTime(2024, 1, 8), // 08/January/2024
    depatureDate: DateTime(2024, 1, 14), // 14/January/2024
    totalAmount: 5400.0,
  ),
  Booking(
    customerName: 'Chris Moore',
    phoneNumber: '0771122334',
    nicNumber: '776655443V',
    email: 'chrismoore@gmail.com',
    bookingStatus: 'Ongoing',
    roomType: 'Deluxe',
    noOfRooms: 2,
    noOfDays: 3,
    arrivalDate: DateTime(2024, 7, 1), // 01/July/2024
    depatureDate: DateTime(2024, 7, 4), // 04/July/2024
    totalAmount: 1600.0,
  ),
  Booking(
    customerName: 'Jessica White',
    phoneNumber: '0772233445',
    nicNumber: '998877665V',
    email: 'jessicawhite@gmail.com',
    bookingStatus: 'Completed',
    roomType: 'Standard',
    noOfRooms: 1,
    noOfDays: 4,
    arrivalDate: DateTime(2024, 9, 10), // 10/September/2024
    depatureDate: DateTime(2024, 9, 14), // 14/September/2024
    totalAmount: 1400.0,
  ),
  Booking(
    customerName: 'Michael Green',
    phoneNumber: '0775566778',
    nicNumber: '112244556V',
    email: 'michaelgreen@gmail.com',
    bookingStatus: 'Ongoing',
    roomType: 'Suite',
    noOfRooms: 3,
    noOfDays: 5,
    arrivalDate: DateTime(2024, 10, 5), // 05/October/2024
    depatureDate: DateTime(2024, 10, 10), // 10/October/2024
    totalAmount: 3900.0,
  ),
  Booking(
    customerName: 'Linda Adams',
    phoneNumber: '0776677889',
    nicNumber: '223344556V',
    email: 'lindaadams@gmail.com',
    bookingStatus: 'Completed',
    roomType: 'Deluxe',
    noOfRooms: 2,
    noOfDays: 4,
    arrivalDate: DateTime(2024, 12, 1), // 01/December/2024
    depatureDate: DateTime(2024, 12, 5), // 05/December/2024
    totalAmount: 2200.0,
  ),
];
