import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todos/model/user.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';

  static const myUser = User (
    imagePath: 'https://i-mom.unimedias.fr/2020/09/16/dragon-ball-songoku.jpg?auto=format,compress&cs=tinysrgb',
    name: 'Son Goku',
    email: 'goku@gmail.com',
    about: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
  );

  static Future init() async =>
    _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser , json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);
    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}