class Employee {
  final String name;
  final String? role;
  final String? id;
  final String email;
  final String nic;
  final String phone_no;
  final int? roleId;

  Employee({
    required this.name,
    this.role,
    this.id,
    this.roleId,
    required this.email,
    required this.nic,
    required this.phone_no,
  });

  // Method to convert an instance of Employee to a map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'nic': nic,
      'phoneNumber': phone_no,
      'roleId': roleId
    };
  }

  // Factory constructor to create an instance of Employee from a JSON
  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone_no: map['phoneNumber'].toString() ?? '',
      nic: map['nic'].toString() ?? '',
      id: map['employeeId'].toString() ?? '',
      role: map['role'],
    );
  }
}
