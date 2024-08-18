class City {
  String name;
  int id;
  DateTime? lastUpdate;

  City({
    required this.name,
    required this.id,
    this.lastUpdate,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json['Name'],
      id: json['Id'],
      lastUpdate: json['LastUpdate'] != null
          ? DateTime.parse(json['LastUpdate'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Id': id,
      'LastUpdate': lastUpdate?.toIso8601String(),
    };
  }
}
