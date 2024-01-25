import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets/my_app_bar.dart';
import 'package:learn_flutter/widgets/state_layout.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        centerTitle: "",
      ),
      body: StateLayout(type: StateType.empty),
    );
  }
}
