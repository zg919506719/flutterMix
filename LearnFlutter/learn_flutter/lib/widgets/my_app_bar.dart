import 'package:flutter/cupertino.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String centerTitle;

  const MyAppBar({super.key, this.centerTitle = ""});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => const Size.fromHeight(48.0);
}
