import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        required this.id,
        required this.email,
        required this.password,
        required this.name,
        required this.age,
        required this.gender,
        required this.phoneNumber,
        required this.address,
        required this.isAdmin,
    });

    String id;
    String email;
    String password;
    String name;
    String age;
    String gender;
    String phoneNumber;
    String address;
    String isAdmin;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        password: json["PASSWORD"],
        name: json["NAME"],
        age: json["AGE"],
        gender: json["GENDER"],
        phoneNumber: json["PHONE_NUMBER"],
        address: json["ADDRESS"],
        isAdmin: json["isAdmin"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "PASSWORD": password,
        "NAME": name,
        "AGE": age,
        "GENDER": gender,
        "PHONE_NUMBER": phoneNumber,
        "ADDRESS": address,
        "isAdmin": isAdmin,
    };
} 