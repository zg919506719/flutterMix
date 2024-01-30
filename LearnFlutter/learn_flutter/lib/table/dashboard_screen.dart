import 'package:flutter/cupertino.dart';
import 'package:learn_flutter/util/device_utils.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [if (Device.isDeskWide(context)) Text("data")],
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
  }
}
