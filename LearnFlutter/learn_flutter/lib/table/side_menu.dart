import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learn_flutter/util/image_utils.dart';
import 'package:learn_flutter/widgets/load_image.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: LoadAssetImage("logo")),
          DrawerListTile(title: "Dashboard",
              svgSrc: ImageUtils.getImgPath(
                  "icons/menu_dashboard", format: ImageFormat.svg),
              press: () {})
        ],
      ),
    );
  }

}

class DrawerListTile extends StatelessWidget {
  final String title, svgSrc;
  final VoidCallback press;

  DrawerListTile({super.key,
    required this.title, required this.svgSrc, required this.press});


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(svgSrc, height: 16,),
      title: Text(title, style: const TextStyle(color: Colors.white54),),
    );
  }
}

