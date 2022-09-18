import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sinibank/services/auth_service.dart';

import '../models/user.dart';

class FirestoreDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteUser(String userId) async {
    try {
      await _firestore.collection("users").doc(userId).delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String? uid) async {
    try {
      DocumentSnapshot _doc =
      await _firestore.collection("users").doc(uid).get();
      return UserModel?.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> setOpenApiCode(String code) async {
    try {
      await _firestore.collection("users").doc(Get.find<AuthService>().user.id).update({
        "apiCode": code,
      });

      Get.find<AuthService>().user = UserModel(
        id: Get.find<AuthService>().user.id,
        name: Get.find<AuthService>().user.name,
        email: Get.find<AuthService>().user.email,
        apiCode: code
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> isAlreadyRegisterUser(String? uid) async {
    try {
      DocumentSnapshot _doc = await _firestore.collection("users").doc(uid).get();

      if (_doc.data() == null) { return false; } else { return true; }
    } catch (e) {
      return false;
    }
  }
}