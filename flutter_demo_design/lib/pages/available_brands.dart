import 'package:flutter/material.dart';
import 'package:flutter_demo_design/config/components/app_bar.dart';
import 'package:flutter_demo_design/config/components/bottom_nav_bar.dart';
import 'package:flutter_demo_design/config/components/brands.dart';

class AvailableBrands extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(showLocation: true,),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Brands(),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/demo_poster.png',
                  ),
                ),
              ),
            ],
          ),
          BottomNavBar(),
        ],
      ),
    );
  }
}
