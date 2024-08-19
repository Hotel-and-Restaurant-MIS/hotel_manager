class Employee {
  final String name;
  final String role;
  final String id;
  final String email;
  final String nic;
  final String phone_no;
  final String image_url;

  Employee(
      {required this.name,
      required this.role,
       this.id ='0',
      required this.email,
      required this.nic,
      required this.phone_no,
      required this.image_url});
}
