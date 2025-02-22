// ignore_for_file: prefer_final_fields

import 'package:example_ui/features/shared/models/user_model.dart';
import 'package:example_ui/features/shared/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  FirebaseService _firebaseService;

  UserModel _tempUser = UserModel(id: "", fullName: "", email: "", password: "");

  User? _firebaseUser;

  UserModel get tempUser => _tempUser;

  User? get firebaseUser => _firebaseUser;

  bool _loggedIn = false;

  bool get loggedIn => _loggedIn;

  static AuthService? _singleton;

  factory AuthService(FirebaseService firebaseService) {
    _singleton ??= AuthService._internal(firebaseService);
    return _singleton!;
  }

  AuthService._internal(this._firebaseService);

  void setTempUserEmail(String email) {
    _tempUser.email = email;

    debugPrint("AuthService - setTempUserEmail: tempUser: $_tempUser");
    notifyListeners();
  }

  void setTempUserName(String name) {
    _tempUser.fullName = name;

    debugPrint("AuthService - setTempUserName: tempUser: $_tempUser");

    notifyListeners();
  }

  void setTempUserPassword(String password) {
    _tempUser.password = password;

    debugPrint("AuthService - setTempUserPassword: tempUser: $_tempUser");

    notifyListeners();
  }

  void setLoggedIn(bool isLoggedIn) {
    _loggedIn = isLoggedIn;
    notifyListeners();
  }

  Future<void> createUserWithEmailAndPassword() async {
    debugPrint("AuthService - createUserWithEmailAndPassword: _tempUser: $_tempUser");
    UserCredential firebaseUserCredentials =
        await _firebaseService.authInstance.createUserWithEmailAndPassword(email: _tempUser.email!, password: _tempUser.password!);

    _firebaseUser = firebaseUserCredentials.user;

    debugPrint("new user created successfully: $_firebaseUser");

    notifyListeners();
  }

  Future<void> signInWithEmailAndPassword() async {
    var userCredential =
        await _firebaseService.authInstance.signInWithEmailAndPassword(email: _tempUser.email!, password: _tempUser.password!);

    _firebaseUser = userCredential.user;

    debugPrint("current user: $_firebaseUser");

    notifyListeners();
  }

  Future<void> deleteUser() async {
    await _firebaseUser?.delete();
  }

  Future<void> resetpassword() async {
    await _firebaseService.authInstance.sendPasswordResetEmail(email: _tempUser.email!);
  }

  void resetResources() {
    _tempUser = UserModel(id: "", fullName: "", email: "", password: "");
    notifyListeners();
  }
}
