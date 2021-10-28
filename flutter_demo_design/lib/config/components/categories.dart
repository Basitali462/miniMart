import 'package:flutter/material.dart';
import 'package:flutter_demo_design/config/components/popup/product_detail_popupp.dart';
import 'package:flutter_demo_design/config/data_files/category_data.dart';
import 'package:flutter_demo_design/config/theme/app_theme.dart';
import 'package:flutter_demo_design/provider/category_change_provider.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<CategoryProvider>(context);
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
                ? categoryScrolledItems(index, provider)
                : categoryItems(index, provider);
          },),
        ),
        shrinkTopList ? Divider(thickness: 1.5,) : Container(),
        SizedBox(height: 10,),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: GridView.builder(
              controller: controller,
              shrinkWrap: true,
              itemCount: 50,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4
              ),
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context){
                        return ProductDetailPopup();
                      }
                    );
                  },
                  child: Container(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image.asset(
                        provider.selectedCategory,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.lightGreen.withOpacity(0.5),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                    width: 80,
                    height: 80,
                    padding: EdgeInsets.all(16),
                  ),
                );
              },),
          ),
        ),
      ],
    );
  }

  Widget categoryItems(int index, CategoryProvider provider){
    return GestureDetector(
      onTap: (){
        provider.changeIndex(index);
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

  Widget categoryScrolledItems(int index, CategoryProvider provider){
    return GestureDetector(
      onTap: (){
        provider.changeIndex(index);
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

