import 'package:flutter/material.dart';
import '../model/user.dart';
import 'package:todos/screens/edit_profile.dart';
import 'package:todos/utils/user_preferences.dart';
import '../widget/appbar.dart';
import 'package:todos/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        children: [
          TextButton(
            onPressed: () async {
              dynamic result =
                  await Navigator.pushNamed(context, '/edit_profile');
              setState(() {});
            },
            child: ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () async {},
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          buildName(user),
          buildAbout(user)
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildAbout(User user) => Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'À propos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            )
          ],
        ),
      );
}
