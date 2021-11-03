import 'package:flutter/material.dart';
import 'package:flutter_demo_design/config/components/category_items.dart';
import 'package:flutter_demo_design/config/components/popup/product_detail_popupp.dart';
import 'package:flutter_demo_design/config/data_files/category_data.dart';
import 'package:flutter_demo_design/config/enums/app_state_enum.dart';
import 'package:flutter_demo_design/config/models/items_model.dart';
import 'package:flutter_demo_design/config/services/sheet_api.dart';
import 'package:flutter_demo_design/config/theme/app_theme.dart';
import 'package:flutter_demo_design/provider/add_item_provider.dart';
import 'package:flutter_demo_design/provider/category_change_provider.dart';
import 'package:flutter_demo_design/provider/fetch_items_provider.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {

  /*Widget categoryTitle(){
    return Row(
      children: [
        Text(
          'Categories',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        Text(
          'See all',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }*/
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  ScrollController controller = ScrollController();
  bool shrinkTopList = false;
  CategoryProvider provider;
  FetchItemProvider fetchProvider;
  AddItemProvider addItemProvider;
  List<ItemsModel> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
      controller.addListener(() {
        setState(() {
          shrinkTopList = controller.offset > 50;
          provider.onListScroll(shrinkTopList);
        });
      });
    }
    //fetchCategoryData();
  }

  /*fetchCategoryData(){
    fetchProvider.setCategoryItemToShow(0);
  }*/

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<CategoryProvider>(context);
    fetchProvider = Provider.of<FetchItemProvider>(context);
    addItemProvider = Provider.of<AddItemProvider>(context);
    //provider.onListScroll(controller);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //categoryTitle(),
        //SizedBox(height: 20,),
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: shrinkTopList ? 50 : 130,
          padding: EdgeInsets.only(left: 18),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: CategoryData().category.length,
            itemBuilder: (context, index){
            return shrinkTopList
                ? categoryScrolledItems(index, provider, addItemProvider)
                : categoryItems(index, provider, addItemProvider);
          },),
        ),
        shrinkTopList ? Divider(thickness: 1.5,) : Container(),
        SizedBox(height: 10,),
        Expanded(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: GridView.builder(
                  controller: controller,
                  shrinkWrap: true,
                  itemCount: fetchProvider.itemToDisplay.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4
                  ),
                  itemBuilder: (context, index){
                    return CategoryListItems(provider: provider, item: fetchProvider.itemToDisplay[index],);
                  },),
              ),
              addItemProvider.currentAppState == AppStateEnum.idle
                  ? Container()
                  : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget categoryItems(int index, CategoryProvider provider, AddItemProvider itemProvider){
    //print('category index');
    return GestureDetector(
      onTap: () async{
        provider.changeIndex(index);
        itemProvider.changeAppState(AppStateEnum.busy);
        items = await SheetApi.getProducts();
        fetchProvider.fetchAllItems(items);
        fetchProvider.setCategoryItemToShow(provider.selectedCategoryName);
        itemProvider.changeAppState(AppStateEnum.idle);
      },
      child: Container(
        margin: EdgeInsets.only(right: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: provider.currentIndex == index
              ? AppTheme.selectedContainerColor
              : Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 6,
              child: Container(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.asset(
                    CategoryData().category[index].categoryImg,
                    width: 20,
                    height: 20,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: CategoryData().category[index].bgColor,
                ),
                margin: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                width: 80,
                height: 80,
                padding: EdgeInsets.all(18),
              ),
            ),
            Spacer(),
            Expanded(
              flex: 2,
              child: Text(
                CategoryData().category[index].categoryName,
                style: TextStyle(
                  color: provider.currentIndex == index ? Colors.white : Colors.black,
                ),
              ),
            ),
            //SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }

  Widget categoryScrolledItems(int index, CategoryProvider provider, AddItemProvider itemProvider){
    return GestureDetector(
      onTap: () async{
        provider.changeIndex(index);
        itemProvider.changeAppState(AppStateEnum.busy);
        items = await SheetApi.getProducts();
        fetchProvider.fetchAllItems(items);
        fetchProvider.setCategoryItemToShow(provider.selectedCategoryName);
        itemProvider.changeAppState(AppStateEnum.idle);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 4, bottom: 8),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: provider.currentIndex == index
              ? AppTheme.selectedContainerColor
              : Colors.transparent,
        ),
        child: Text(
          CategoryData().category[index].categoryName,
          style: TextStyle(
            color: provider.currentIndex == index ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

