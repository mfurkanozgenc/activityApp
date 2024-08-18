import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String fullName;
  final String identificationNumber;
  final String image;
  final String password;
  final String phoneNumber;
  final String userName;
  final num userType;
  final num date;
  final String id;

  User({
    required this.userName,
    required this.fullName,
    required this.password,
    required this.image,
    required this.identificationNumber,
    required this.phoneNumber,
    required this.date,
    required this.userType,
    required this.id,
  });

  factory User.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return User(
      userName: data['userName'] ?? '',
      fullName: data['fullName'] ?? '',
      password: data['password'] ?? '',
      image: data['image'] ?? '',
      identificationNumber: data['identificationNumber'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      date: data['date'] ?? '',
      userType: data['userType'] ?? '',
      id: doc.id,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userName: json['userName'],
      fullName: json['fullName'],
      password: json['password'],
      image: json['image'],
      identificationNumber: json['identificationNumber'],
      phoneNumber: json['phoneNumber'],
      date: json['date'],
      userType: json['userType'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'fullName': fullName,
      'password': password,
      'image': image,
      'identificationNumber': identificationNumber,
      'phoneNumber': phoneNumber,
      'date': date,
      'userType': userType,
      'id': id,
    };
  }
}
