import "package:flutter/material.dart";
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";
import "package:practice/persisten_bottom_bar/custom_nav_bar_widget.dart";
import "package:practice/persisten_bottom_bar/screens.dart";
import 'package:practice/bottom_screens/next_page.dart';
import "package:practice/screens/profile_page.dart";

class CustomWidgetExample extends StatefulWidget {
  const CustomWidgetExample({final Key? key, required this.menuScreenContext})
      : super(key: key);
  final BuildContext menuScreenContext;

  @override
  _CustomWidgetExampleState createState() => _CustomWidgetExampleState();
}

class _CustomWidgetExampleState extends State<CustomWidgetExample> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() => [
        MainScreen(
          menuScreenContext: widget.menuScreenContext!,
          hideStatus: _hideNavBar,
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar;
            });
          },
        ),
        MainScreen(
          menuScreenContext: widget.menuScreenContext!,
          hideStatus: _hideNavBar,
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar;
            });
          },
        ),
        MainScreen(
          menuScreenContext: widget.menuScreenContext!,
          hideStatus: _hideNavBar,
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar;
            });
          },
        ),
        MainScreen(
          menuScreenContext: widget.menuScreenContext!,
          hideStatus: _hideNavBar,
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar;
            });
          },
        ),
        Container(
          color: Colors.red,
        )
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: "Home",
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.search),
          title: "Search",
          activeColorPrimary: Colors.teal,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.add),
          title: "Add",
          activeColorPrimary: Colors.deepOrange,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.settings),
          title: "Settings",
          activeColorPrimary: Colors.indigo,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.settings),
            title: "Settings",
            activeColorPrimary: Colors.indigo,
            inactiveColorPrimary: Colors.grey,
            onPressed: (context) {
              showModalBottomSheet(
                context: context!,
                backgroundColor: Colors.white,
                useRootNavigator: true,
                builder: (final context) => Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Exit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            }),
      ];

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Navigation Bar Demo")),
        drawer: Drawer(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text("This is the Drawer"),
              ],
            ),
          ),
        ),
        body: PersistentTabView.custom(
          context,
          controller: _controller,
          screens: _buildScreens(),
          itemCount: 5,
          hideNavigationBar: _hideNavBar,
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),

          handleAndroidBackButtonPress: true,
          onWillPop: (final context) async {
            await showDialog(
              context: context!,
              useSafeArea: true,
              builder: (final context) => Container(
                height: 50,
                width: 50,
                color: Colors.white,
                child: ElevatedButton(
                  child: const Text("Close"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            );
            return false;
          },
          customWidget: CustomNavBarWidget(
            _navBarsItems(),
            onItemSelected: (final index) {
              // if(index==4){
              //   showModalBottomSheet(
              //     context: context,
              //     backgroundColor: Colors.white,
              //     useRootNavigator: true,
              //     builder: (final context) => Center(
              //       child: ElevatedButton(
              //         onPressed: () =>   PersistentNavBarNavigator.pushNewScreen(
              //           context,
              //           screen: NextPage(),
              //           withNavBar: true,
              //         ),
              //
              //         child: const Text(
              //           "Exit",
              //           style: TextStyle(color: Colors.white),
              //         ),
              //       ),
              //     ),
              //   );
              // }
              // else{
              setState(
                () {
                  _controller.index =
                      index; // THIS IS CRITICAL!! Don't miss it!
                },
              );
              // }
            },
            selectedIndex: _controller.index,
          ),
        ),
      );
}
