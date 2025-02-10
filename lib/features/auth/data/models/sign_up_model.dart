class SignUpModel {
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String mobile;
  final String city;

  SignUpModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.mobile,
    required this.city,
  });

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "phone": mobile,
      "city": city,
    };
  }
}
