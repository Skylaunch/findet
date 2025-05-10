import 'dart:convert';

import 'package:findet/domain/models/user_model.dart';
import 'package:findet/domain/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServiceImpl extends AuthService {
  static const String userKey = 'user_key';
  static const String userTokenKey = 'user_token_key';
  late final SharedPreferences sharedPreferences;

  @override
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    _authUser = _getAuthUser();
    notifyListeners();
  }

  @override
  String? getToken() {
    return sharedPreferences.getString(userTokenKey);
  }

  @override
  bool isAuthenticated() {
    return sharedPreferences.containsKey(userTokenKey);
  }

  @override
  void saveToken({required String token}) {
    sharedPreferences.setString(userTokenKey, token);
  }

  @override
  void logout() {
    sharedPreferences.remove(userTokenKey);
  }

  @override
  UserModel? get authUser => _authUser;
  UserModel? _authUser;

  UserModel? _getAuthUser() {
    final userString = sharedPreferences.getString(userKey);
    final id = getToken();
    if (userString != null && id != null) {
      final userMap = jsonDecode(userString) as Map<String, dynamic>;
      return UserModel.fromJson(userMap, id);
    }
    return null;
  }

  @override
  void saveUser({required UserModel user}) {
    sharedPreferences.setString(userKey, jsonEncode(user.toJson()));

    _authUser = _getAuthUser();

    notifyListeners();
  }
}
