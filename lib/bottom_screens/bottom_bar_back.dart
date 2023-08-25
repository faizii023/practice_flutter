import 'package:flutter/material.dart';
import 'package:practice/bottom_screens/home_page.dart';
import 'package:practice/bottom_screens/likes_page.dart';
import 'package:practice/bottom_screens/next_page.dart';
import 'package:practice/bottom_screens/profile_page.dart';

class BottomWithBack extends StatefulWidget {
  const BottomWithBack({Key? key}) : super(key: key);

  @override
  State<BottomWithBack> createState() => _BottomWithBackState();
}

class _BottomWithBackState extends State<BottomWithBack> {
  int _pageIndex = 0;
  Map<int, GlobalKey> navigatorKeys = {
    0: GlobalKey(),
    1: GlobalKey(),
    2: GlobalKey(),
    3: GlobalKey(),
  };
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
       debugPrint(
            'On Will called ${navigatorKeys[_pageIndex]?.currentState?.context.widget}');
        // return !await navigatorKeys[_pageIndex].currentState.context;
       debugPrint("WillPop ${await Navigator.maybePop(
           navigatorKeys[_pageIndex]!.currentState!.context)}");
        return !await Navigator.maybePop(
            navigatorKeys[_pageIndex]!.currentState!.context);
        // Navigator.pop(navigatorKeys[_pageIndex].currentState.context);
      },
      child: Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: _pageIndex,
            children:  <Widget>[
              HomeScree(navigatorKey: navigatorKeys[0]!,),
              ProfileScreen(navigatorKey: navigatorKeys[1]!,),
              LikesPage(navigatorKey: navigatorKeys[2]!,),
              NextPage(navigatorKey: navigatorKeys[3]!,),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.computer),
              label: 'Technology',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Education',
            ),
          ],
          currentIndex: _pageIndex,
          onTap: (int index) {
            setState(
              () {
                _pageIndex = index;
              },
            );
          },
        ),
      ),
    );
  }
}
