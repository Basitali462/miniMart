import 'package:flutter/material.dart';
import 'package:flutter_demo_design/config/arc_components/arc.dart';
import 'package:flutter_demo_design/config/arc_components/arc_clipper.dart';
import 'package:flutter_demo_design/config/arc_components/clip_shadow.dart';
import 'package:flutter_demo_design/config/arc_components/edge.dart';
import 'package:flutter_demo_design/config/components/app_bar.dart';
import 'package:flutter_demo_design/config/components/bottom_nav_bar.dart';
import 'package:flutter_demo_design/config/components/categories.dart';
import 'package:flutter_demo_design/config/components/search_bar.dart';
import 'package:flutter_demo_design/pages/custom_drawer.dart';
import 'package:flutter_demo_design/provider/category_change_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoryProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(provider.shrinkTopList ? 0 : 50),
        child: CustomAppBar(showLocation: true,),
      ),
      drawer: CustomDrawer(),
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10,),
                //SearchBar(hintText: 'Search Products',),
                //SizedBox(height: 20,),
                Expanded(child: Categories()),
              ],
            ),
          ),
          //BottomNavBar(),
        ],
      ),
    );
  }
}
