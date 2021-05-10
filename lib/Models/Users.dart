import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

class Users {
  String id;
  String email;
  String name;
  String phone;

  Users({
    @required this.email,
    @required this.id,
    @required this.name,
    @required this.phone,
  });

  Users.fromSnapshot(DataSnapshot dataSnapshot) {
    id = dataSnapshot.key;
    email = dataSnapshot.value["email"];
    name = dataSnapshot.value["name"];
    phone = dataSnapshot.value["phone"];
  }
}
