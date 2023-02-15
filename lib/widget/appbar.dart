import 'package:flutter/material.dart';
import 'package:todos/utils/user_preferences.dart';

AppBar buildAppBar(BuildContext context) {
  final user = UserPreferences.getUser();

  return AppBar(
      elevation: 0,
      backgroundColor: Colors.purple,
      title: ModalRoute.of(context)!.settings.name == '/edit_profile' ||
              ModalRoute.of(context)!.settings.name == '/profile'
          ? null
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/profile');
                    },
                    child: Text(
                      'profil',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ));
}
