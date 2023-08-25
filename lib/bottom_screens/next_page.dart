import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key, required this.navigatorKey}) : super(key: key);
  final GlobalKey navigatorKey;
  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(builder: (BuildContext context){
          return Scaffold(
              appBar: AppBar(
                title:const Text("NextPage"),
              ),
              body: const Center(
                child: Text("NextPage"),
              )
          );
        });
      },
    );
  }
}
