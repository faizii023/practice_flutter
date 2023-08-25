import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:practice/persisten_bottom_bar/screens.dart';
late BuildContext testContext;
class PersistentBottomBarView extends StatefulWidget {
  const PersistentBottomBarView({Key? key,  this.menuScreenContext}) : super(key: key);
  final BuildContext? menuScreenContext;
  @override
  State<PersistentBottomBarView> createState() => _PersistentBottomBarViewState();
}

class _PersistentBottomBarViewState extends State<PersistentBottomBarView> {
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
      menuScreenContext: widget.menuScreenContext,
      hideStatus: _hideNavBar,
      onScreenHideButtonPressed: () {
        setState(() {
          _hideNavBar = !_hideNavBar;
        });
      },
    ),
    MainScreen(
      menuScreenContext: widget.menuScreenContext,
      hideStatus: _hideNavBar,
      onScreenHideButtonPressed: () {
        setState(() {
          _hideNavBar = !_hideNavBar;
        });
      },
    ),
    MainScreen(
      menuScreenContext: widget.menuScreenContext,
      hideStatus: _hideNavBar,
      onScreenHideButtonPressed: () {
        setState(() {
          _hideNavBar = !_hideNavBar;
        });
      },
    ),
    MainScreen(
      menuScreenContext: widget.menuScreenContext,
      hideStatus: _hideNavBar,
      onScreenHideButtonPressed: () {
        setState(() {
          _hideNavBar = !_hideNavBar;
        });
      },
    ),
    MainScreen(
      menuScreenContext: widget.menuScreenContext,
      hideStatus: _hideNavBar,
      onScreenHideButtonPressed: () {
        setState(() {
          _hideNavBar = !_hideNavBar;
        });
      },
    ),
  ];
  List<PersistentBottomNavBarItem> _navBarsItems() => [
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.search),
      title: "Search",
      activeColorPrimary: Colors.teal,
      inactiveColorPrimary: Colors.grey,
      routeAndNavigatorSettings: RouteAndNavigatorSettings(
        initialRoute: "/",
        routes: {
          "/first": (final context) => const MainScreen2(),
          "/second": (final context) => const MainScreen3(),
        },
      ),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.add),
      title: "Add",
      activeColorPrimary: Colors.blueAccent,
      inactiveColorPrimary: Colors.grey,
      routeAndNavigatorSettings: RouteAndNavigatorSettings(
        initialRoute: "/",
        routes: {
          "/first": (final context) => const MainScreen2(),
          "/second": (final context) => const MainScreen3(),
        },
      ),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.message),
      title: "Messages",
      activeColorPrimary: Colors.deepOrange,
      inactiveColorPrimary: Colors.grey,
      routeAndNavigatorSettings: RouteAndNavigatorSettings(
        initialRoute: "/",
        routes: {
          "/first": (final context) => const MainScreen2(),
          "/second": (final context) => const MainScreen3(),
        },
      ),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.settings),
      title: "Settings",
      activeColorPrimary: Colors.indigo,
      inactiveColorPrimary: Colors.grey,
      routeAndNavigatorSettings: RouteAndNavigatorSettings(
        initialRoute: "/",
        routes: {
          "/first": (final context) => const MainScreen2(),
          "/second": (final context) => const MainScreen3(),
        },
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        resizeToAvoidBottomInset: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,
        bottomScreenMargin: 0,
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
        selectedTabScreenContext: (final context) {
          testContext = context!;
        },
        backgroundColor: Colors.black,
        hideNavigationBar: _hideNavBar,
        decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
        ),
        navBarStyle: NavBarStyle
            .style19, // Choose the nav bar style with this property
      ),
    );
  }
}
