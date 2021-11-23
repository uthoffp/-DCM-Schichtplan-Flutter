class Company {
  String? city;
  String companyName1;
  String? companyName2;
  String id;
  String? phone;
  Object? picture;
  String? postcode;
  String? street;

  Company(
      {this.city,
      required this.companyName1,
      this.companyName2,
      required this.id,
      this.phone,
      this.picture,
      this.postcode,
      required this.street});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      city: json['City'],
      companyName1: json['CompanyName1'],
      companyName2: json['CompanyName2'],
      id: json['ID'],
      phone: json['Phone'],
      picture: json['Picture'],
      postcode: json['Postcode'],
      street: json['Street'],
    );
  }

  @override
  String toString() {
    return companyName1;
  }
}
