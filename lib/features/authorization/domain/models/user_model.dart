part of '../../authorization.dart';

UserModel userModelFromMap(String str) {
  return UserModel.fromMap(json.decode(str));
}

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  UserModel({
    this.id,
    this.email,
    this.password,
  });

  int? id;
  String? email;
  String? password;

  UserModel copyWith({
    int? id,
    String? email,
    String? password,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "password": password,
      };
}
