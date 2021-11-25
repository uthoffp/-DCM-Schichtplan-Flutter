class SpecialTime {
  int? blue;
  int? daysInAdvance;
  int? green;
  String name;
  int? red;
  String? shortName;
  int typeKey;

  SpecialTime(
      {this.blue, this.daysInAdvance, this.green, required this.name, this.red, this.shortName, required this.typeKey});

  factory SpecialTime.fromJson(Map<String, dynamic> json) {
    return SpecialTime(
      blue: json['Blue'],
      daysInAdvance: json['DaysInAdvance'],
      green: json['Green'],
      name: json['Name'],
      red: json['Red'],
      shortName: json['ShortName'],
      typeKey: json['TypeKey'],
    );
  }

  @override
  String toString() {
    return name;
  }
}
