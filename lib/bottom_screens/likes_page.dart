import 'package:flutter/material.dart';
class LikesPage extends StatefulWidget {
  const LikesPage({Key? key, required this.navigatorKey}) : super(key: key);
  final GlobalKey navigatorKey;
  @override
  State<LikesPage> createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesPage> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(builder: (BuildContext context){
          return Scaffold(
              appBar: AppBar(
                title:const Text("LikesPage"),
              ),
              body: const Center(
                child: Text("LikesPage"),
              )
          );
        });
      },
    );
  }
}
