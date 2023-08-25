import 'package:flutter/material.dart';

class SearchFieldView extends StatefulWidget {
  const SearchFieldView({Key? key, required this.isOpen}) : super(key: key);
final VoidCallback isOpen;
  @override
  State<SearchFieldView> createState() => _SearchFieldViewState();
}

class _SearchFieldViewState extends State<SearchFieldView> {
  List<Map<String, Object>> coinList = [
    {"name": "Bitcoin", "imagePath": "assets/images/btc.png","subName":"BTC"},
    {"name": "LTC", "imagePath": "assets/images/ltc.png","subName":"LTC"},
    {"name": "Dogecoin", "imagePath": "assets/images/dogecoin.png","subName":"DOGE"},
    {"name": "Polygon", "imagePath": "assets/images/polygon.png","subName":"MATIC"},
    {"name": "Solana", "imagePath": "assets/images/solana.png","subName":"SOL"},
    {"name": "Shiba INU", "imagePath": "assets/images/shiba.png","subName":"SHIB"},
    {"name": "Litecoin", "imagePath": "assets/images/litecoin.png","subName":"LTC"},
    {"name": "TRON", "imagePath": "assets/images/tron.png","subName":"TRX"},
    {"name": "Cardano", "imagePath": "assets/images/cardano.png","subName":"ADA"},
    {"name": "Chiliz", "imagePath": "assets/images/chiliz.png","subName":"CHZ"},
    {"name": "Bitcoin", "imagePath": "assets/images/btc.png","subName":"BTC"},
    {"name": "LTC", "imagePath": "assets/images/ltc.png","subName":"LTC"},
    {"name": "Dogecoin", "imagePath": "assets/images/dogecoin.png","subName":"DOGE"},
    {"name": "Polygon", "imagePath": "assets/images/polygon.png","subName":"MATIC"},
    {"name": "Solana", "imagePath": "assets/images/solana.png","subName":"SOL"},
    {"name": "Shiba INU", "imagePath": "assets/images/shiba.png","subName":"SHIB"},
    {"name": "Litecoin", "imagePath": "assets/images/litecoin.png","subName":"LTC"},
    {"name": "TRON", "imagePath": "assets/images/tron.png","subName":"TRX"},
    {"name": "Cardano", "imagePath": "assets/images/cardano.png","subName":"ADA"},
    {"name": "Chiliz", "imagePath": "assets/images/chiliz.png","subName":"CHZ"},
  ];
List<Map<String, Object>> currencyList=[
  {"name": "BTC - IND", "imagePath": "assets/images/btc_ind.png"},
  {"name": "BTC - USD", "imagePath": "assets/images/btc.png"},
  {"name": "BTC - USDT", "imagePath": "assets/images/btc.png"},
];
  List<Map<String, Object>> filteredCurrencyList = [];
  List<Map<String, Object>> filteredCoinList = [];

  void _coinFilter(String query) {
    List<Map<String, Object>> filteredList = [];
    for (var item in coinList) {
      if (item['name'].toString().toLowerCase().contains(query.toLowerCase())||item['subName'].toString().toLowerCase().contains(query.toLowerCase())) {
        filteredList.add(item);
      }
    }
    setState(() {
      filteredCoinList = filteredList;
    });
  }

  final _searchController = TextEditingController();
  final _coinsSearchController = TextEditingController();

  final focus = FocusNode();

  void _currencyFilter(String query) {
    List<Map<String, Object>> filteredList = [];
    for (var item in currencyList) {
      if (item['name'].toString().toLowerCase().contains(query.toLowerCase())) {
        filteredList.add(item);
      }
    }
    setState(() {
      filteredCoinList = filteredList;
    });
  }
  @override
  void dispose() {
    _searchController.dispose();
    _coinsSearchController.dispose();
    focus.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void onTap() {
    setState(() {
      filteredCoinList = coinList;
    });
  }
  void onCoinTap() {
    setState(() {
      filteredCurrencyList = currencyList;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                child: TextField(
                  onChanged: _coinFilter,
                  onTap: onTap,
                  controller: _searchController,
                  focusNode: focus,
                  cursorColor: Colors.white,
                  decoration:  InputDecoration(
                    // suffixIcon: Icon(
                    //   Icons.search,
                    //   color: Colors.black45,
                    // ),
                    suffixIcon: GestureDetector(
                      child: const Icon(
                        Icons.search,
                        color: Colors.black45,
                      ),
                      onTap: (){
                        filteredCoinList=[];
                      },
                    ),
                    fillColor: Colors.white,
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffD9D9D9), width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    filled: true,
                    focusColor: const Color(0xff1C2B5E),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff1C2B5E)),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.symmetric(horizontal: 8),
              //
              //   decoration: BoxDecoration(
              //       color: Colors.red,
              //       border: Border.all(color:const Color(0xffD9D9D9),),),
              //   child: ListView.builder(
              //     itemCount: filteredCoinList.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return ListTile(
              //         style: ListTileStyle.list,
              //         leading: Image.asset(
              //           filteredCoinList[index]['imagePath'].toString(),
              //           width: 25.0,
              //           height: 25.0,
              //         ),
              //         title: Text(filteredCoinList[index]['name'].toString()),
              //         onTap: () {
              //           _searchController.text =
              //           "${filteredCoinList[index]['name']}";
              //           setState(() {
              //             filteredCoinList = [];
              //           });
              //         },
              //       );
              //     },
              //   ),
              // ),

              if(filteredCoinList.isNotEmpty)
                Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  // height: ,
                  height: 200,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffD9D9D9))),
                  child: ListView.builder(
                    itemCount: filteredCoinList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        style: ListTileStyle.list,
                        leading: Image.asset(
                          filteredCoinList[index]['imagePath'].toString(),
                          width: 38.0,
                          height: 38.0,
                        ),
                        subtitle: Text(filteredCoinList[index]['subName'].toString()),
                        title: Text(filteredCoinList[index]['name'].toString()),
                        onTap: () {
                          _searchController.text =
                              "${filteredCoinList[index]['name']}";
                          setState(() {
                            filteredCoinList = [];
                          });
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),

    );
  }
}
