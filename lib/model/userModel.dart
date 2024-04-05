import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.userId,
     this.buildingId,
    required this.userType,
    required this.userName,
    required this.email,
    required this.userTel,
    required this.userImage,
    required this.userPreAddress,
    required this.userPerAddress,
    required this.userNid,
    required this.userDesignation,
    required this.userDateCreation,
    required this.userEndingDate,
    required this.userStatus,
    required this.userCurrlang,
    this.userSalary,
    required  this.userMemberType,
    required  this.createdAt,
    required this.updatedAt,
    this.publicId,
    this.buildings,
    this.currencies,
  });

  int userId;
  dynamic buildingId;
  String userType;
  String userName;
  String email;
  String userTel;
  String userImage;
  String userPreAddress;
  String userPerAddress;
  String userNid;
  String userDesignation;
  DateTime userDateCreation;
  DateTime userEndingDate;
  int userStatus;
  String userCurrlang;
  dynamic userSalary;
  String userMemberType;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic publicId;
  dynamic buildings;
  dynamic currencies;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json["user_id"],
    buildingId: json["building_id"],
    userType: json["user_type"],
    userName: json["user_name"],
    email: json["email"],
    userTel: json["user_tel"],
    userImage: json["user_image"],
    userPreAddress: json["user_pre_address"],
    userPerAddress: json["user_per_address"],
    userNid: json["user_nid"],
    userDesignation: json["user_designation"],
    userDateCreation: DateTime.parse(json["user_date_creation"]),
    userEndingDate: DateTime.parse(json["user_ending_date"]),
    userStatus: json["user_status"],
    userCurrlang: json["user_currlang"],
    userSalary: json["user_salary"],
    userMemberType: json["user_member_type"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    publicId: json["public_id"],
    buildings: json["buildings"],
    currencies: json["currencies"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "building_id": buildingId,
    "user_type": userType,
    "user_name": userName,
    "email": email,
    "user_tel": userTel,
    "user_image": userImage,
    "user_pre_address": userPreAddress,
    "user_per_address": userPerAddress,
    "user_nid": userNid,
    "user_designation": userDesignation,
    "user_date_creation": "${userDateCreation.year.toString().padLeft(4, '0')}-${userDateCreation.month.toString().padLeft(2, '0')}-${userDateCreation.day.toString().padLeft(2, '0')}",
    "user_ending_date": "${userEndingDate.year.toString().padLeft(4, '0')}-${userEndingDate.month.toString().padLeft(2, '0')}-${userEndingDate.day.toString().padLeft(2, '0')}",
    "user_status": userStatus,
    "user_currlang": userCurrlang,
    "user_salary": userSalary,
    "user_member_type": userMemberType,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "public_id": publicId,
    "buildings": buildings,
    "currencies": currencies,
  };
}
