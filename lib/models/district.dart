class District {
  int cityId;
  String name;
  int id;
  DateTime? lastUpdate;

  District({
    required this.cityId,
    required this.name,
    required this.id,
    this.lastUpdate,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      cityId: json['CityId'],
      name: json['Name'],
      id: json['Id'],
      lastUpdate: json['LastUpdate'] != null
          ? DateTime.parse(json['LastUpdate'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CityId': cityId,
      'Name': name,
      'Id': id,
      'LastUpdate': lastUpdate?.toIso8601String(),
    };
  }
}
