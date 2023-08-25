import 'package:flutter/material.dart';

class HomeScree extends StatefulWidget {
  const HomeScree({Key? key, required this.navigatorKey}) : super(key: key);
  final GlobalKey navigatorKey;

  @override
  State<HomeScree> createState() => _HomeScreeState();
}

class _HomeScreeState extends State<HomeScree> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(builder: (BuildContext context){
          return Scaffold(
              appBar: AppBar(
                title:const Text("HomeScree"),
              ),
              body: const Center(
                child: Text("HomeScree"),
              )
          );
        });
      },
    );
  }
}
