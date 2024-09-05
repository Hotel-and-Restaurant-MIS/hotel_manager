class Employee {
  final String name;
  final String role;
  final String id;
  final String email;
  final String nic;
  final String phone_no;

  Employee({
    required this.name,
    required this.role,
    required this.id,
    required this.email,
    required this.nic,
    required this.phone_no,
  });

  // Method to convert an instance of MenuItem to a map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'role': role,
      'id': id,
      'email': email,
      'nic': nic,
      'phone_no': phone_no,
    };
  }
  // Factory constructor to create an instance of MenuItem from a JSON
  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
        id: map['id'],
        name: map['name'],
        role: map['role'],
        email: map['email'],
        nic: map['nic'],
        phone_no: map['phone_no']);
  }
}
