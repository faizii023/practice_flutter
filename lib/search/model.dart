class SearchItem {
  final String name;
  final String imagePath;

  SearchItem.init()
      : name = "",
        imagePath = "";

  SearchItem.fromMap(Map<String, Object> map)
      : name = map['name'] as String,
        imagePath = map['imagePath'] as String;

  SearchItem({required this.name, required this.imagePath});
}
// List<Map<String, Object>> list=[
//   {"name": "BTC - IND", "imagePath": "assets/images/btc_ind.png"},
//   {"name": "BTC - USD", "imagePath": "assets/images/btc.png"},
//   {"name": "BTC - USDT", "imagePath": "assets/images/btc.png"},
// ];
List<Map<String, Object>> list=[
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