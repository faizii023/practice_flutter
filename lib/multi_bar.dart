import 'package:flutter/material.dart';

class MultiBar extends StatefulWidget {
  const MultiBar({Key? key}) : super(key: key);

  @override
  State<MultiBar> createState() => _MultiBarState();
}

class _MultiBarState extends State<MultiBar> {
  List<String> items = [
    "Home",
    "Explore",
    "Search",
    "Feed",
    "Post",
    "Activity",
    "Setting",
    "Profile"
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        margin: const EdgeInsets.all(8),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.all(5),
                        width: 80,
                        height: 45,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? Colors.white70
                              : Colors.white54,
                          borderRadius: currentIndex == index
                              ? BorderRadius.circular(15)
                              : BorderRadius.circular(10),
                          border: currentIndex == index
                              ? Border.all(
                              color: Colors.deepPurpleAccent, width: 2)
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            items[index],
                            style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                              color: currentIndex == index
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
