import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_design/config/components/app_title.dart';
import 'package:flutter_demo_design/config/theme/app_theme.dart';
import 'package:flutter_demo_design/provider/category_change_provider.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  final bool showLocation;
  CustomAppBar({this.showLocation});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: (){
          //Scaffold.of(context).openDrawer();
        },
        child: Image.asset(
          'assets/icons/menu.png',
        ),
      ),
      title: showLocation ? AppTitle() : Container(),
      actions: [
        GestureDetector(
          onTap: (){

          },
          child: Image.asset(
            'assets/icons/Icon-search.png',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 28, left: 12),
          child: Badge(
            //badgeContent: Text('0'),
            badgeColor: Colors.white,
            elevation: 0,
            position: BadgePosition.topEnd(),
            child: Image.asset(
              'assets/icons/cart.png',
            ),
          ),
        ),
      ],
    );
  }
}
