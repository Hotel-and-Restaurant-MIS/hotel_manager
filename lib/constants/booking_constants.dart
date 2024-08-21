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
    arrivalDate: DateTime(2024, 3, 20),
    departureDate: DateTime(2024, 3, 23),
    totalAmount: 1500.0,
    roomList: []
  ),
  Booking(
      customerName: 'Jane Smith',
      phoneNumber: '0779876543',
      nicNumber: '987654321V',
      email: 'janesmith@gmail.com',
      bookingStatus: 'Completed',
      roomType: 'Suite',
      noOfRooms: 3,
      noOfDays: 5,
      arrivalDate: DateTime(2024, 4, 15),
      departureDate: DateTime(2024, 4, 20),
      totalAmount: 2500.0,
      roomList: ['106', '108', '109']
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
    arrivalDate: DateTime(2024, 5, 10),
    departureDate: DateTime(2024, 5, 14),
    totalAmount: 3200.0,
      roomList: []
  ),
  Booking(
      customerName: 'Emily Johnson',
      phoneNumber: '0773344556',
      nicNumber: '556677889V',
      email: 'emilyjohnson@gmail.com',
      bookingStatus: 'Completed',
      roomType: 'Deluxe',
      noOfRooms: 9,
      noOfDays: 2,
      arrivalDate: DateTime(2024, 2, 25),
      departureDate: DateTime(2024, 2, 27),
      totalAmount: 1800.0,
      roomList: ['201', '202', '203','304', '305', '506','604', '105', '406']
  ),
  Booking(
    customerName: 'David Wilson',
    phoneNumber: '0774455667',
    nicNumber: '667788990V',
    email: 'davidwilson@gmail.com',
    bookingStatus: 'Ongoing',
    roomType: 'Deluxe',
    noOfRooms: 1,
    noOfDays: 7,
    arrivalDate: DateTime(2024, 6, 5),
    departureDate: DateTime(2024, 6, 12),
    totalAmount: 2100.0,
      roomList: []
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
    arrivalDate: DateTime(2024, 3, 20),
    departureDate: DateTime(2024, 3, 23),
    totalAmount: 1500.0,
      roomList: []
  ),
  Booking(
      customerName: 'Jane Smith',
      phoneNumber: '0779876543',
      nicNumber: '987654321V',
      email: 'janesmith@gmail.com',
      bookingStatus: 'Completed',
      roomType: 'Deluxe',
      noOfRooms: 3,
      noOfDays: 5,
      arrivalDate: DateTime(2024, 4, 15),
      departureDate: DateTime(2024, 4, 20),
      totalAmount: 2500.0,
      roomList: ['304', '305', '306']
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
    arrivalDate: DateTime(2024, 5, 10),
    departureDate: DateTime(2024, 5, 14),
    totalAmount: 3200.0,
      roomList: []
  ),
  Booking(
      customerName: 'Emily Johnson',
      phoneNumber: '0773344556',
      nicNumber: '556677889V',
      email: 'emilyjohnson@gmail.com',
      bookingStatus: 'Completed',
      roomType: 'Deluxe',
      noOfRooms: 1,
      noOfDays: 2,
      arrivalDate: DateTime(2024, 2, 25),
      departureDate: DateTime(2024, 2, 27),
      totalAmount: 1800.0,
      roomList: ['405']
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
    arrivalDate: DateTime(2024, 6, 5),
    departureDate: DateTime(2024, 6, 12),
    totalAmount: 2100.0,
      roomList: []
  ),
  Booking(
      customerName: 'Sarah Davis',
      phoneNumber: '0779988776',
      nicNumber: '334455667V',
      email: 'sarahdavis@gmail.com',
      bookingStatus: 'Completed',
      roomType: 'Suite',
      noOfRooms: 4,
      noOfDays: 6,
      arrivalDate: DateTime(2024, 1, 8),
      departureDate: DateTime(2024, 1, 14),
      totalAmount: 5400.0,
      roomList: ['501', '502', '503', '504']
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
    arrivalDate: DateTime(2024, 7, 1),
    departureDate: DateTime(2024, 7, 4),
    totalAmount: 1600.0,
      roomList: []
  ),
  Booking(
      customerName: 'Jessica White',
      phoneNumber: '0772233445',
      nicNumber: '998877665V',
      email: 'jessicawhite@gmail.com',
      bookingStatus: 'Completed',
      roomType: 'Standard',
      noOfRooms: 2,
      noOfDays: 4,
      arrivalDate: DateTime(2024, 9, 10),
      departureDate: DateTime(2024, 9, 14),
      totalAmount: 1400.0,
      roomList: ['601', '602']
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
    arrivalDate: DateTime(2024, 10, 5),
    departureDate: DateTime(2024, 10, 10),
    totalAmount: 3900.0,
      roomList: []
  ),
  Booking(
      customerName: 'Linda Adams',
      phoneNumber: '0776677889',
      nicNumber: '223344556V',
      email: 'lindaadams@gmail.com',
      bookingStatus: 'Completed',
      roomType: 'Deluxe',
      noOfRooms: 5,
      noOfDays: 4,
      arrivalDate: DateTime(2024, 12, 1),
      departureDate: DateTime(2024, 12, 5),
      totalAmount: 2200.0,
      roomList: ['701', '702', '703','708','401']
  ),
];
