import 'package:flutter/material.dart';

class BottomSheetView extends StatefulWidget {
  const BottomSheetView({Key? key}) : super(key: key);

  @override
  State<BottomSheetView> createState() => _BottomSheetViewState();
}

class _BottomSheetViewState extends State<BottomSheetView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        width: double.infinity,
        height: 400,
        decoration: const BoxDecoration(
          color: Color(0xff1C2B5E),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 29),
              child: GestureDetector(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          AssetImage('assets/images/profile_placeholder.jpg'),
                      // child: Image.asset(
                      //   "assets/images/profile_placeholder.jpg",
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Row(children: const <Widget>[
              SizedBox(
                width: 40,
                child: Divider(
                  color: Colors.white,
                  thickness: 3,
                ),
              ),
              Text(
                " Assets  ",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Expanded(
                child: Divider(
                  color: Colors.white,
                  thickness: 3,
                ),
              ),
            ]),
            const SizedBox(height: 6),
            Row(
              children: [
                const SizedBox(width: 20),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 18),
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          // backgroundImage:
                          //     AssetImage('assets/images/Tax.png'),
                          backgroundColor: Colors.white,
                          radius: 25,
                          // backgroundImage:
                          //     AssetImage('assets/images/Tax.png'),
                          child: Image.asset(
                            "assets/images/Tax.png",
                            height: 35,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Tax",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 40),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 18),
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: Image.asset(
                            "assets/images/Settings.png",
                            height: 35,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Settings",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(children: const <Widget>[
              SizedBox(
                width: 40,
                child: Divider(
                  color: Colors.white,
                  thickness: 3,
                ),
              ),
              Text(
                " Read  ",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Expanded(
                child: Divider(
                  color: Colors.white,
                  thickness: 3,
                ),
              ),
            ]),
            const SizedBox(height: 6),
            Row(
              children: [
                const SizedBox(width: 20),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            // backgroundImage:
                            //     AssetImage('assets/images/Tax.png'),
                            backgroundColor: Colors.white,
                            radius: 25,
                            // backgroundImage:
                            //     AssetImage('assets/images/Tax.png'),
                            child: Image.asset(
                              "assets/images/Events.png",
                              height: 35,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Events",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 25,
                            child: Image.asset(
                              "assets/images/News.png",
                              height: 35,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "News",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 25,
                            child: Image.asset(
                              "assets/images/Learn.png",
                              height: 35,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Learn",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 25,
                            child: Image.asset(
                              "assets/images/Blog.png",
                              height: 35,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Blog",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
