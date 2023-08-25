import 'package:flutter/material.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.navigatorKey}) : super(key: key);
  final GlobalKey navigatorKey;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(builder: (BuildContext context){
          return Scaffold(
              appBar: AppBar(
                title:const Text("ProfileScreen"),
              ),
              body: const Center(
                child: Text("ProfileScreen"),
              )
          );
        });
      },
    );
  }
}
