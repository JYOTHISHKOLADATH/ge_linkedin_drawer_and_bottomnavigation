import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ModalLoginStatus welcomeFromJson(String str) => ModalLoginStatus.fromJson(json.decode(str));


class ModalLoginStatus{
// String username='';
// final password='';
  String message;
  // bool isAlready;
  ModalLoginStatus({
    required this.message,
    // required this.isAlready
  });


  factory ModalLoginStatus.fromJson(Map<String, dynamic> json) {
    return ModalLoginStatus(
       message: json["message"],
      // isAlready: json["isAlready"]
    );
  }


  // factory ModalLoginStatus.fromJson(Map<String ,dynamic> json) => ModalLoginStatus{
  //   return ModalLoginStatus(
  // message: json[message],
  // isAlready: json["isAlready"]
  // );
  //
  // }

  // Map<String ,dynamic>tojson()=>{
  //   "username":username,
  //   "userpassword":password
  // };
}