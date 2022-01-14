import 'package:flutter/material.dart';
import 'package:n_store/BloC/CommonBlocClass/BaseMode.dart';

class UserLogin extends BaseModel{


  UserLogin({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  Data? data;
  String? message;


  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
    error: json["error"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "data": data?.toJson(),
    "message": message,
  };

}

class Data {

  Data({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  String? accessToken;
  String? tokenType;
  int? expiresIn;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
  };
}
