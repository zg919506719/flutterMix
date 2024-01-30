import 'package:flutter/material.dart';
import 'package:learn_flutter/table/side_menu.dart';
import 'package:learn_flutter/util/device_utils.dart';

import 'dashboard_screen.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: ,
      drawer: SideMenu(),
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Device.isWeb) Expanded(child: SideMenu()),
          Expanded(
            child: DashBoardScreen(),
            flex: 5,
          )
        ],
      )),
    );
  }
}
