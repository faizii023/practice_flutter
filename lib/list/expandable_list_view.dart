import 'package:flutter/material.dart';
import 'package:practice/list/item.dart';
import 'package:toggle_list/toggle_list.dart';

const Color appColor = Color.fromRGBO(225, 195, 64, 1);

class ExpandableListView extends StatefulWidget {
  const ExpandableListView({Key? key}) : super(key: key);

  @override
  State<ExpandableListView> createState() => _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {
  List<Item> _data = generateItems(20);

  Widget _buildListPanel() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: ToggleList(
        divider: const SizedBox(height: 10),
        toggleAnimationDuration: const Duration(milliseconds: 400),
        scrollPosition: AutoScrollPosition.begin,
        trailing: const Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.expand_more),
        ),

        children: _data.map<ToggleListItem>((Item item) {
          return ToggleListItem(
            itemDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              border: Border.all(color: Colors.black12),
            ),
            content: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Image(
                        image: AssetImage('assets/images/up-arrow.png'),
                        height: 25,
                      ),
                      SizedBox(width: 12),
                      Text(
                        "BTC > \$272.05",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Image(
                        image: AssetImage('assets/images/down-arrow.png'),
                        height: 25,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "BTC < \$272.05",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        child: const Image(
                          image: AssetImage('assets/images/edit.png'),
                          height: 20,
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        child: const Image(
                          image: AssetImage('assets/images/delete.png'),
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    color: Color(0xffD9D9D9),
                    height: 2,
                    thickness: 2,
                    indent: 10,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "+ Add new BTC alert",
                      style: TextStyle(color: Colors.black,fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
            title: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Row(
                children: [
                  const Image(
                    image: AssetImage('assets/images/btc.png'),
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text(
                          item.headerValue,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          item.headerValue,
                          style: const TextStyle(
                            color: Colors.black45,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(item.expandedValue)
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(6),
          child: _buildListPanel(),
        ),
      ),
    );
  }
}



List<Item> generateItems(int numberOfItems) {
  return List.generate(
    numberOfItems,
    (index) {
      return Item(
        expandedValue: "\$302.46",
        headerValue: 'BTC',
      );
    },
  );
}
