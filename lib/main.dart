import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:practice/bottom_screens/bottom_bar_back.dart';
import 'package:practice/example/dropdown_page.dart';
import 'package:practice/list/expandable_list_view.dart';
import 'package:practice/list/toggle_list_view.dart';
import 'package:practice/modals/custom_modal.dart';
import 'package:practice/multi_bar.dart';
import 'package:practice/modals/circular_modal.dart';
import 'package:practice/multi_text_form_field/dynamic_text_field.dart';
import 'package:practice/persisten_bottom_bar/custom-widget-tabs.widget.dart';
import 'package:practice/persisten_bottom_bar/screens.dart';
import 'package:practice/search/custom_search_filed.dart';
import 'package:practice/search/example.dart';
import 'package:practice/search_screen.dart';
import 'package:practice/table/custom_table.dart';
import 'package:practice/table/sticky_header_table.dart';
import 'package:practice/web_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:practice/widgets/bottom_bar.dart';
import 'package:practice/widgets/bottom_bar_page.dart';
import 'package:practice/widgets/bottom_bar_view.dart';
import 'package:practice/widgets/bottom_sheet_view.dart';
import 'package:practice/widgets/custom_dropdown.dart';
import 'package:practice/widgets/example/left_button.dart';
import 'package:practice/widgets/example/right_button.dart';

import 'modals/floating_modal.dart';
import 'modals/modal_complex_all.dart';
import 'modals/modal_fit.dart';
import 'modals/modal_inside_modal.dart';
import 'modals/modal_will_scope.dart';
import 'modals/modal_with_navigator.dart';
import 'modals/modal_with_nested_scroll.dart';
import 'modals/modal_with_scroll.dart';
import 'modals/modal_with_page_view.dart';

import 'package:practice/example/cupertino_share.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

late BuildContext testContext;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(platform: TargetPlatform.iOS),
      darkTheme: ThemeData.dark().copyWith(platform: TargetPlatform.iOS),
      title: 'BottomSheet Modals',
      initialRoute: "/",
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        "/first": (final context) => const MainScreen2(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        "/second": (final context) => const MainScreen3(),
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isViewOpen=false;
  List<Map<String, Object>> currencyList = [
    {"name": "BTC - IND", "imagePath": "assets/images/btc_ind.png"},
    {"name": "BTC - USD", "imagePath": "assets/images/btc.png"},
    {"name": "BTC - USDT", "imagePath": "assets/images/btc.png"},
  ];
int currentIndex=0;
void isOpen(){
  setState(() {
    isViewOpen=!isViewOpen;
  });
}
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor:  Color(0xffD9D9D9),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[
      //     Center(
      //       child: ElevatedButton(
      //         child: const Text("Custom widget example"),
      //         onPressed: () => PersistentNavBarNavigator.pushNewScreen(
      //           context,
      //           screen: CustomWidgetExample(
      //             menuScreenContext: context,
      //           ),
      //         ),
      //       ),
      //     ),
      //     const SizedBox(height: 20),
      //     Center(
      //       child: ElevatedButton(
      //         child: const Text("Built-in styles example"),
      //         onPressed: () => PersistentNavBarNavigator.pushNewScreen(
      //           context,
      //           screen: ProvidedStylesExample(
      //             menuScreenContext: context,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      // body:  ToggleListView(),
      // body:  ExpandableListView(),
      // body:  BottomSheetView(),
      // body: Column(
      //   children: [
      //     const SizedBox(height: 50),
      //      SearchFieldView(isOpen: isOpen),
      //     const SizedBox(height: 20),
      //     CustomDropdown<int>(
      //       onChange: (int index) {
      //         print("index: $index");
      //         currentIndex=index;
      //       } ,
      //
      //       dropdownButtonStyle: const DropdownButtonStyle(
      //           height: 52,
      //           elevation: 1,
      //           backgroundColor: Colors.white,
      //           primaryColor: Colors.black87,
      //
      //           padding: const EdgeInsets.all(10)),
      //       dropdownStyle: DropdownStyle(
      //         margin: 10,
      //         elevation: 1,
      //         padding: const EdgeInsets.all(5),
      //         color: Colors.red,
      //         shape: RoundedRectangleBorder(
      //           side: const BorderSide(
      //             color: Colors.grey,
      //             width: 1,
      //           ),
      //           borderRadius: BorderRadius.circular(7),
      //         ),
      //       ),
      //       items: currencyList
      //           .map((index) => DropdownItem<int>(
      //                 value: index['name'].toString(),
      //                 child: Row(
      //                   children: [
      //                     Image.asset(
      //                       "${index['imagePath']}",
      //                       width: 30.0,
      //                       height: 30.0,
      //                     ),
      //                     const SizedBox(width:10),
      //                     Text(
      //                       index['name'].toString(),
      //                       style: const TextStyle(color: Colors.black),
      //                     ),
      //                   ],
      //                 ),
      //               ))
      //           .toList(),
      //       // items: [
      //       //   'item 1',
      //       //   'item 2',
      //       //   'item 3',
      //       //   'item 4',
      //       // ]
      //       //     .asMap()
      //       //     .entries
      //       //     .map(
      //       //       (item) => DropdownItem<int>(
      //       //         value: item.key + 1,
      //       //         child: Padding(
      //       //           padding: const EdgeInsets.all(8.0),
      //       //           child: Text(item.value),
      //       //         ),
      //       //       ),
      //       //     )
      //       //     .toList(),
      //       child: Container(
      //         color: Colors.red,
      //         child:  Text(
      //           "${currencyList[currentIndex]['name']}",
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      // body:  CustomTableView(),
      // body:  BottomWithBack(),
      // body: StickyHeaderTablePage(),
      // body: DropDownPage(),
      // body: SearchScreen(),
      // body: CustomModal(),
      body: DynamicTextfieldsApp(),
    );
  }
}

// ----------------------------------------- Provided Style ----------------------------------------- //

class ProvidedStylesExample extends StatefulWidget {
  const ProvidedStylesExample({final Key? key, this.menuScreenContext})
      : super(key: key);
  final BuildContext? menuScreenContext;

  @override
  _ProvidedStylesExampleState createState() => _ProvidedStylesExampleState();
}

class _ProvidedStylesExampleState extends State<ProvidedStylesExample> {
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
          handleAndroidBackButtonPress: true,
          // onWillPop: (final context) async {
          //   await showDialog(
          //     context: context!,
          //     useSafeArea: true,
          //     builder: (final context) => Container(
          //       height: 50,
          //       width: 50,
          //       color: Colors.white,
          //       child: ElevatedButton(
          //         child: const Text("Close"),
          //         onPressed: () {
          //           Navigator.pop(context);
          //         },
          //       ),
          //     ),
          //   );
          //   return false;
          // },
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
