import 'package:flutter/material.dart';
import 'package:flutter_demo_design/config/arc_components/arc.dart';
import 'package:flutter_demo_design/config/arc_components/arc_clipper.dart';
import 'package:flutter_demo_design/config/arc_components/clip_shadow.dart';
import 'package:flutter_demo_design/config/arc_components/edge.dart';
import 'package:flutter_demo_design/config/components/app_bar.dart';
import 'package:flutter_demo_design/config/components/bottom_nav_bar.dart';
import 'package:flutter_demo_design/config/components/categories.dart';
import 'package:flutter_demo_design/config/components/search_bar.dart';
import 'package:flutter_demo_design/config/models/items_model.dart';
import 'package:flutter_demo_design/config/services/sheet_api.dart';
import 'package:flutter_demo_design/pages/custom_drawer.dart';
import 'package:flutter_demo_design/provider/category_change_provider.dart';
import 'package:flutter_demo_design/provider/fetch_items_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BuildContext cntxt;
  FetchItemProvider fetchItems;
  CategoryProvider provider;
  List<ItemsModel> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getItems();
  }

  Future getItems() async{
    //print('getting items');
    items = await SheetApi.getProducts();
    fetchItems.fetchAllItems(items);
    fetchItems.setCategoryItemToShow(provider.selectedCategoryName);
    //print(fetchItems.allItems.length);
  }

  @override
  Widget build(BuildContext context) {
    cntxt = context;
    provider = Provider.of<CategoryProvider>(context);
    fetchItems = Provider.of<FetchItemProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(provider.shrinkTopList ? 0 : 50),
        child: CustomAppBar(showLocation: true,),
      ),
      //drawer: CustomDrawer(),
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
