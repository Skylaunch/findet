import 'package:findet/domain/models/user_model.dart';
import 'package:flutter/material.dart';

abstract class AuthService with ChangeNotifier {
  Future<void> init();
  void saveToken({required String token});
  void saveUser({required UserModel user});
  UserModel? get authUser;
  String? getToken();
  bool isAuthenticated();
  void logout();
}
