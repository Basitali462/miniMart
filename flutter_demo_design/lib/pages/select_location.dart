import 'package:flutter/material.dart';
import 'package:flutter_demo_design/config/components/app_bar.dart';
import 'package:flutter_demo_design/config/components/bottom_nav_bar.dart';
import 'package:flutter_demo_design/config/routes/route_constants.dart';
import 'package:flutter_demo_design/pages/available_brands.dart';
import 'package:flutter_demo_design/provider/bottom_bar_provider.dart';
import 'package:provider/provider.dart';

class SelectLocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final navProvider = Provider.of<BottomBarProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: CustomAppBar(showLocation: false,),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: size.width/1.5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Fill Your Location',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.red,
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    navProvider.navigateToPage(context, HomePageView);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomNavBar(),
        ],
      ),
    );
  }
}
