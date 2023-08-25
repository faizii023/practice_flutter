import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/screens/home_page.dart';
import 'package:practice/screens/info_page.dart';
import 'package:practice/screens/profile_page.dart';
import 'package:practice/screens/settings_page.dart';

import '../bottom_screens/next_page.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({Key? key}) : super(key: key);

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  int _selectedIndex = 0;
  final List<BottomNavigationBarItem> _tabItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: "Settings"),
    const BottomNavigationBarItem(icon: Icon(Icons.info), label: "Info"),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];
  void _onItemTapped(int index) {
    // if (index == 3) {
    //   showModalBottomSheet<void>(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return Container(
    //         height: 200,
    //         color: Colors.amber,
    //         child: Center(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             mainAxisSize: MainAxisSize.min,
    //             children: <Widget>[
    //               const Text('Modal BottomSheet'),
    //               ElevatedButton(
    //                 child: const Text('Close BottomSheet'),
    //                 onPressed: () => Navigator.push(context,
    //                   MaterialPageRoute(
    //                     builder: (context) {
    //                       return NextPage();
    //                     },
    //                   ),),
    //               ),
    //             ],
    //           ),
    //         ),
    //       );
    //     },
    //   );
    // } else {
    //   setState(() {
    //     _selectedIndex = index;
    //   });
    // }
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Colors.red,
        items: _tabItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        // items: const <BottomNavigationBarItem>[
        //   BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        //   BottomNavigationBarItem(
        //       icon: Icon(Icons.settings), label: "Settings"),
        //   BottomNavigationBarItem(icon: Icon(Icons.info), label: "Info"),
        //   BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        // ],
      ),
      tabBuilder: (ctx, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (ctx) {
                return const CupertinoPageScaffold(child: HomePage());
              },
            );
          case 1:
            return CupertinoTabView(
              builder: (ctx) {
                return const CupertinoPageScaffold(child: SettingsPage());
              },
            );
          case 2:
            return CupertinoTabView(
              builder: (ctx) {
                return const CupertinoPageScaffold(child: InfoPage());
              },
            );
          case 3:
            return CupertinoTabView(
              builder: (ctx) {
                return const CupertinoPageScaffold(child: ProfilePage());
              },
            );
        }
        return Container();
      },
    );
  }
}
