class User {
  String company;
  String department;
  String familyName;
  String firstName;
  String token;
  String uId;

  User(
      {required this.company,
      required this.department,
      required this.familyName,
      required this.firstName,
      required this.token,
      required this.uId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      company: json['company'],
      department: json['department'],
      familyName: json['familyName'],
      firstName: json['firstName'],
      token: json['token'],
      uId: json['uId'],
    );
  }

  @override
  String toString() {
    return '$firstName $familyName';
  }
}
