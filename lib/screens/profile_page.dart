import 'package:flutter/material.dart';
import 'package:practice/bottom_screens/next_page.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      // backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
      backgroundColor: Colors.transparent,
    );
  }
}
