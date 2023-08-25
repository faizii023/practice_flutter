import 'package:flutter/material.dart';

class DynamicTextfieldsApp extends StatefulWidget {
  const DynamicTextfieldsApp({super.key});

  @override
  State<DynamicTextfieldsApp> createState() => _DynamicTextfieldsAppState();
}

class _DynamicTextfieldsAppState extends State<DynamicTextfieldsApp> {
  var formKey = GlobalKey<FormState>();
  final List _friendsList = [''];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: _friendsList.length,
                  padding: const EdgeInsets.all(20),
                  itemBuilder: (context, index) => Row(
                    children: [
                      Expanded(
                        child: DynamicTextfield(
                          key: UniqueKey(),
                          initialValue: _friendsList[index],
                          onChanged: (v) => _friendsList[index] = v,
                        ),
                      ),
                      const SizedBox(width: 20),
                      _textfieldBtn(index),
                    ],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                ),
              ),
              // submit button
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print(_friendsList);
                    }
                  },
                  child: const Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget _textfieldBtn(int index) {
    bool isLast = index == _friendsList.length - 1;

    return InkWell(
      onTap: () => setState(
            () => isLast ? _friendsList.add('') : _friendsList.removeAt(index),
      ),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isLast ? Colors.green : Colors.red,
        ),
        child: Icon(
          isLast ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}
class DynamicTextfield extends StatefulWidget {
  const DynamicTextfield(
      {super.key, this.initialValue, required this.onChanged});

  final String? initialValue;
  final void Function(String) onChanged;

  @override
  State<DynamicTextfield> createState() => _DynamicTextfieldState();
}

class _DynamicTextfieldState extends State<DynamicTextfield> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = widget.initialValue ?? '';
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onChanged: widget.onChanged,
      decoration: const InputDecoration(hintText: "Enter your friend's name"),
      validator: (v) {
        if (v == null || v.trim().isEmpty) return 'Please enter something';
        return null;
      },
    );
  }
}
