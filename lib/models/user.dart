import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? apiCode;

  UserModel({this.id, this.name, this.email, this.apiCode});

  UserModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    email = documentSnapshot["email"];
    try { apiCode = documentSnapshot["apiCode"]; } catch(e) {  }
  }
}