import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets/my_search_bar.dart';

class AddressSelectPage extends StatefulWidget {
  const AddressSelectPage({super.key});

  @override
  State<AddressSelectPage> createState() => _AddressSelectPageState();
}

class _AddressSelectPageState extends State<AddressSelectPage> {



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MySearchBar(
        onPressed: (text){
          print(text);
        },
      ),
      body: SafeArea(
        child: Text(""),
      ),
    );
  }
}
