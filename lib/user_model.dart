import 'dart:ffi';
import 'package:flutter/rendering.dart';

class UserModel {
  String? uid;
  String? email;
  String? firstname;
  String? secondname;
  String? tel;

  UserModel({this.uid, this.email, this.firstname, this.secondname, this.tel});

  //receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstname: map['firstname'],
      secondname: map['secondname'],
      tel: map['tel'],
    );
  }

  //sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstname': firstname,
      'secondname': secondname,
      'tel': tel,
    };
  }
}