class RegisterRequestModel {
  final String firstName;
  final String lastName;
  final int age;
  final String email;
  final String password;
  RegisterRequestModel({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'age': age,
    'email': email,
    'password': password,
  };
}
