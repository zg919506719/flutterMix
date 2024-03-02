import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_2d_amap/flutter_2d_amap.dart';
import 'package:learn_flutter/widgets/my_search_bar.dart';

import '../widgets/my_button.dart';

class AddressSelectPage extends StatefulWidget {
  const AddressSelectPage({super.key});

  @override
  State<AddressSelectPage> createState() => _AddressSelectPageState();
}

class _AddressSelectPageState extends State<AddressSelectPage> {
  AMap2DController? _aMap2DController;
  int _index = 0;
  List<PoiSearch> _list = [];

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    Flutter2dAMap.updatePrivacy(true);

    /// 配置key
    Flutter2dAMap.setApiKey(
      iOSKey: '4327916279bf45a044bb53b947442387',
      webKey: '4e479545913a3a180b3cffc267dad646',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MySearchBar(
        onPressed: (text) {
          _controller.animateTo(0.0,
              duration: const Duration(milliseconds: 10), curve: Curves.ease);
          _index = 0;
          _aMap2DController?.search(text);
        },
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: AMap2DView(
            onAMap2DViewCreated: (AMap2DController controller) {
              _aMap2DController = controller;
            },
            onPoiSearched: (List<PoiSearch> result) {
              _controller.animateTo(0.0,
                  duration: const Duration(milliseconds: 10),
                  curve: Curves.ease);
              _index = 0;
              _list = result;
              setState(() {});
            },
          )),
          Expanded(
            flex: 11,
              child: ListView.separated(
                  controller: _controller,
                  itemBuilder: (context,index){
                    return Text("data");
                  },
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: _list.length),
                ),
        ],
      )),
    );
  }
}
