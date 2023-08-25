import 'package:flutter/material.dart';
import 'package:practice/search/country_search.dart';
import 'package:practice/search/custom_search_filed.dart';
import 'package:practice/search/demo.dart';
import 'package:practice/search/dynamic_suggestions.dart';
class SearchExample extends StatefulWidget {
  const SearchExample({Key? key}) : super(key: key);

  @override
  State<SearchExample> createState() => _SearchExampleState();
}

class _SearchExampleState extends State<SearchExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('SearchField Demo')),
        body: Column(
          children: [
            ListTile(
              title: const Text('Demo App'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => DemoApp()));
              },
            ),
            ListTile(
              title: const Text('Country Search'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => CountrySearch(
                      title: 'Country List',
                    )));
              },
            ),
            ListTile(
              title: const Text('Dynamic sample'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const DynamicSample()));
              },
            ),
            // ListTile(
            //   title: const Text('SearchField'),
            //   onTap: () {
            //     Navigator.of(context)
            //         .push(MaterialPageRoute(builder: (_) => const SearchFieldView()));
            //   },
            // ),
          ],
        ));
  }
}
