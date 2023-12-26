import 'dart:convert';

class UserModel {
  String? userName;
  String? profileImg;
  String? location;
  String? isOnline;
  int? age;
  String? about;

  UserModel({
    this.userName,
    this.profileImg,
    this.location,
    this.isOnline,
    this.age,
    this.about,
  });

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userName: json["user_name"],
        profileImg: json["profile_img"],
        location: json["location"],
        isOnline: json["is_online"],
        age: json["age"],
        about: json["about"],
      );

  Map<String, dynamic> toJson() => {
        "user_name": userName,
        "profile_img": profileImg,
        "location": location,
        "is_online": isOnline,
        "age": age,
        "about": about,
      };
}
