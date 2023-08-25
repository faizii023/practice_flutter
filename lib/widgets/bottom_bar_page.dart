import 'package:flutter/material.dart';
import 'package:practice/screens/home_page.dart';
import 'package:practice/screens/info_page.dart';
import 'package:practice/screens/settings_page.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  Map<int, GlobalKey> navigatorKeys = {
    0: GlobalKey(),
    1: GlobalKey(),
    2: GlobalKey(),
    3: GlobalKey(),
  };
  int currentPageindex = 0;
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Container(
      color: Colors.blue[200],
      child: const Text(
        'Index 0: Home',
      ),
    ),
    WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Container(
        color: Colors.green[200],
        child: const Text(
          'Index 1: Account Page ',
        ),
      ),
    ),
    WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Container(
        color: Colors.purple[200],
        child: const Text(
          'Index 2: Setting Page',
        ),
      ),
    ),
    const HomePage(),
    const InfoPage(),
    const SettingsPage()
  ];

  void _onItemTapped(int index) {
    if (index <= 2) {
      setState(() {
        _selectedIndex = index;
        currentPageindex = index;
      });
    } else {
      showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,

        builder: (BuildContext context) {
          return SizedBox(
            height: 200,
            child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  IconButton(
                    color: Theme.of(context).primaryColor,
                    icon: const Icon(Icons.phone),
                    onPressed: () {
                      setState(() {
                        currentPageindex = 3;

                      });
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    color: Theme.of(context).primaryColor,
                    icon: const Icon(Icons.message),
                    onPressed: () {
                      setState(() {
                        currentPageindex = 4;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    color: Theme.of(context).primaryColor,
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {
                      setState(() {
                        currentPageindex = 5;
                      });
                      Navigator.pop(context);
                    },
                  ),
                ])),
          );

          // return Container(
          //   width: double.infinity,
          //   height: 400,
          //   decoration: const BoxDecoration(
          //     color: Color(0xff1C2B5E),
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(20),
          //       topRight: Radius.circular(20),
          //     ),
          //   ),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Container(
          //         margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 29),
          //         child: GestureDetector(
          //           onTap: () {},
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: const [
          //               CircleAvatar(
          //                 radius: 25,
          //                 backgroundColor: Colors.white,
          //                 backgroundImage:
          //                 AssetImage('assets/images/profile_placeholder.jpg'),
          //                 // child: Image.asset(
          //                 //   "assets/images/profile_placeholder.jpg",
          //                 //   fit: BoxFit.fill,
          //                 // ),
          //               ),
          //               SizedBox(
          //                 height: 10,
          //               ),
          //               Text(
          //                 "Profile",
          //                 style: TextStyle(color: Colors.white),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       Row(children: const <Widget>[
          //         SizedBox(
          //           width: 40,
          //           child: Divider(
          //             color: Colors.white,
          //             thickness: 3,
          //           ),
          //         ),
          //         Text(
          //           " Assets  ",
          //           style: TextStyle(color: Colors.white, fontSize: 16),
          //         ),
          //         Expanded(
          //           child: Divider(
          //             color: Colors.white,
          //             thickness: 3,
          //           ),
          //         ),
          //       ]),
          //       const SizedBox(height: 6),
          //       Row(
          //         children: [
          //           const SizedBox(width: 20),
          //           Container(
          //             margin: const EdgeInsets.symmetric(vertical: 18),
          //             child: GestureDetector(
          //               onTap: () {},
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   CircleAvatar(
          //                     // backgroundImage:
          //                     //     AssetImage('assets/images/Tax.png'),
          //                     backgroundColor: Colors.white,
          //                     radius: 25,
          //                     // backgroundImage:
          //                     //     AssetImage('assets/images/Tax.png'),
          //                     child: Image.asset(
          //                       "assets/images/Tax.png",
          //                       height: 35,
          //                       fit: BoxFit.contain,
          //                     ),
          //                   ),
          //                   const SizedBox(
          //                     height: 10,
          //                   ),
          //                   const Text(
          //                     "Tax",
          //                     style: TextStyle(color: Colors.white),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //           const SizedBox(width: 40),
          //           Container(
          //             margin: const EdgeInsets.symmetric(vertical: 18),
          //             child: GestureDetector(
          //               onTap: () {},
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   CircleAvatar(
          //                     backgroundColor: Colors.white,
          //                     radius: 25,
          //                     child: Image.asset(
          //                       "assets/images/Settings.png",
          //                       height: 35,
          //                       fit: BoxFit.contain,
          //                     ),
          //                   ),
          //                   const SizedBox(
          //                     height: 10,
          //                   ),
          //                   const Text(
          //                     "Settings",
          //                     style: TextStyle(color: Colors.white),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //       Row(children: const <Widget>[
          //         SizedBox(
          //           width: 40,
          //           child: Divider(
          //             color: Colors.white,
          //             thickness: 3,
          //           ),
          //         ),
          //         Text(
          //           " Read  ",
          //           style: TextStyle(color: Colors.white, fontSize: 16),
          //         ),
          //         Expanded(
          //           child: Divider(
          //             color: Colors.white,
          //             thickness: 3,
          //           ),
          //         ),
          //       ]),
          //       const SizedBox(height: 6),
          //       Row(
          //         children: [
          //           const SizedBox(width: 20),
          //           Expanded(
          //             child: Container(
          //               margin: const EdgeInsets.symmetric(vertical: 20),
          //               child: GestureDetector(
          //                 onTap: () {},
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.center,
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     CircleAvatar(
          //                       // backgroundImage:
          //                       //     AssetImage('assets/images/Tax.png'),
          //                       backgroundColor: Colors.white,
          //                       radius: 25,
          //                       // backgroundImage:
          //                       //     AssetImage('assets/images/Tax.png'),
          //                       child: Image.asset(
          //                         "assets/images/Events.png",
          //                         height: 35,
          //                         fit: BoxFit.contain,
          //                       ),
          //                     ),
          //                     const SizedBox(
          //                       height: 10,
          //                     ),
          //                     const Text(
          //                       "Events",
          //                       style: TextStyle(color: Colors.white),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //           const SizedBox(width: 30),
          //           Expanded(
          //             child: Container(
          //               margin: const EdgeInsets.symmetric(vertical: 20),
          //               child: GestureDetector(
          //                 onTap: () {},
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.center,
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     CircleAvatar(
          //                       backgroundColor: Colors.white,
          //                       radius: 25,
          //                       child: Image.asset(
          //                         "assets/images/News.png",
          //                         height: 35,
          //                         fit: BoxFit.contain,
          //                       ),
          //                     ),
          //                     const SizedBox(
          //                       height: 10,
          //                     ),
          //                     const Text(
          //                       "News",
          //                       style: TextStyle(color: Colors.white),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //           const SizedBox(width: 30),
          //           Expanded(
          //             child: Container(
          //               margin: const EdgeInsets.symmetric(vertical: 20),
          //               child: GestureDetector(
          //                 onTap: () {},
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   crossAxisAlignment: CrossAxisAlignment.center,
          //                   children: [
          //                     CircleAvatar(
          //                       backgroundColor: Colors.white,
          //                       radius: 25,
          //                       child: Image.asset(
          //                         "assets/images/Learn.png",
          //                         height: 35,
          //                         fit: BoxFit.contain,
          //                       ),
          //                     ),
          //                     const SizedBox(
          //                       height: 10,
          //                     ),
          //                     const Text(
          //                       "Learn",
          //                       style: TextStyle(color: Colors.white),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //           const SizedBox(width: 30),
          //           Expanded(
          //             child: Container(
          //               margin: const EdgeInsets.symmetric(vertical: 20),
          //               child: GestureDetector(
          //                 onTap: () {},
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   crossAxisAlignment: CrossAxisAlignment.center,
          //                   children: [
          //                     CircleAvatar(
          //                       backgroundColor: Colors.white,
          //                       radius: 25,
          //                       child: Image.asset(
          //                         "assets/images/Blog.png",
          //                         height: 35,
          //                         fit: BoxFit.contain,
          //                       ),
          //                     ),
          //                     const SizedBox(
          //                       height: 10,
          //                     ),
          //                     const Text(
          //                       "Blog",
          //                       style: TextStyle(color: Colors.white),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //           const SizedBox(width: 30),
          //         ],
          //       ),
          //     ],
          //   ),
          // );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(currentPageindex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'more',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
