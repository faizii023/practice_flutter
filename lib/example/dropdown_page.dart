import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class DropDownPage extends StatefulWidget {
  const DropDownPage({Key? key}) : super(key: key);

  @override
  State<DropDownPage> createState() => _DropDownPageState();
}

class _DropDownPageState extends State<DropDownPage> {
  String? _selected;
  DateTime dateTime = DateTime.now();
  final List<Map> _myJson = [
    {
      "id": 1,
      "image":
          "https://res.cloudinary.com/dxcfomhnp/image/upload/v1681901571/crypto/fagkzez7or36bkv8yddd.png",
      "name": "Am bank"
    },
    {
      "id": 2,
      "image":
          "https://res.cloudinary.com/dxcfomhnp/image/upload/v1681901571/crypto/jtixcitodyzao1z5umzn.png",
      "name": "Hsbc bank"
    },
    {
      "id": 3,
      "image":
          "https://res.cloudinary.com/dxcfomhnp/image/upload/v1681901571/crypto/jtixcitodyzao1z5umzn.png",
      "name": "Public bank"
    },
    {
      "id": 4,
      "image":
          "https://res.cloudinary.com/dxcfomhnp/image/upload/v1681901571/crypto/jtixcitodyzao1z5umzn.png",
      "name": "Uob bank"
    }
  ];
  final List<Map> data = [
    {
      "id":1,
      "currency": "inr",
      "image":
      "https://res.cloudinary.com/dxcfomhnp/image/upload/v1681901571/crypto/fagkzez7or36bkv8yddd.png",
      "name": "INR"
    },
    {
      "id":2,
      "currency": "usd",
      "image":
      "https://res.cloudinary.com/dxcfomhnp/image/upload/v1682591514/crypto/ihujx3gap0szirboohak.png",
      "name": "USD"
    },
    {
      "id":3,
      "currency": "btc-usd",
      "image":
      "https://res.cloudinary.com/dxcfomhnp/image/upload/v1681901571/crypto/jtixcitodyzao1z5umzn.png",
      "name": "BTC-USDT"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton(
                          hint: const Text(
                            "select",
                            style: TextStyle(color: Colors.black),
                          ),
                          value: _selected,
                          onChanged: (newValue) {
                            setState(() {
                              _selected = newValue!;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                          dropdownColor: Colors.white,
                          items: data
                              .map(
                                (bankItem) => DropdownMenuItem(
                                  value: bankItem['id'].toString(),
                                  child: Row(
                                    children: [
                                      Image.network(
                                        bankItem['image'],
                                        width: 25,
                                        height: 25,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        bankItem['name'],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // ElevatedButton(
              //     onPressed: () {
              //       debugPrint(
              //           "${dateTime.year}/${dateTime.month}/${dateTime.day}");
              //       DatePicker.showDateTimePicker(context,
              //           showTitleActions: true,
              //           // theme:  DatePickerTheme(
              //           //
              //           //   headerColor: Colors.orange,
              //           //   backgroundColor: Colors.blue,
              //           //   itemStyle: TextStyle(
              //           //       color: Colors.white,
              //           //       fontWeight: FontWeight.bold,
              //           //       fontSize: 18),
              //           //   doneStyle:
              //           //       TextStyle(color: Colors.white, fontSize: 16),
              //           // ),
              //           // minTime: DateTime(2018, 3, 5),
              //           // maxTime: DateTime(2019, 6, 7),
              //           onChanged: (date) {
              //         print('change $date');
              //       }, onConfirm: (date) {
              //         print('confirm $date');
              //       }, currentTime: DateTime.now(), locale: LocaleType.en);
              //     },
              //     child: const Text("Click me")),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () async {
                    final date=await pickDateOmni();
                    if(date==null) return;
                    debugPrint("Date picked ${date.year}/${date.month}/${date.day} ${date.hour} ${date.minute} ");
                  }, child: const Text("Select date"),),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  final date=await pickDateTime();
                  if(date==null) return;
                  debugPrint("Date picked  ${date.hour} ${date.minute} ");
                }, child: const Text("Select time"),),
            ],
          ),
        ),
      ),
    );
  }
  Future<DateTime?>pickDateOmni()=>showOmniDateTimePicker(context: context,startFirstDate: DateTime(1900),startLastDate: DateTime(2100),);
  Future<DateTime?>pickDate()=>showDatePicker(context: context,firstDate: DateTime(1900),lastDate: DateTime(2100),initialDate: dateTime);
  Future<TimeOfDay?>pickTime()=>showTimePicker(context: context,initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),);

  Future<DateTime?>pickDateTime()async{
    DateTime? date=await pickDate();
    if(date==null) return null;
    TimeOfDay ?time=await pickTime();
    if(time==null) return null;
  }
}
