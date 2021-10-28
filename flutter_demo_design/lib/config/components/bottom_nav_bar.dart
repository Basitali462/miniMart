import 'package:flutter/material.dart';
import 'package:flutter_demo_design/config/arc_components/arc.dart';
import 'package:flutter_demo_design/config/arc_components/arc_clipper.dart';
import 'package:flutter_demo_design/config/arc_components/edge.dart';
import 'package:flutter_demo_design/config/routes/route_constants.dart';
import 'package:flutter_demo_design/provider/bottom_bar_provider.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<BottomBarProvider>(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(left: 18, bottom: 36, right: 18),
        child: Row(
          children: [
            Expanded(
              child: Arc(
                height: 18,
                arcType: ArcType.CONVEY,
                edge: Edge.RIGHT,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 24),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(0.1, 0.1),
                      ),
                      BoxShadow(
                        blurRadius: 2,
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(-0.1, -0.1),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          if(navProvider.currentTab != HomePageView){
                            navProvider.navigateToPage(context, HomePageView);
                          }
                        },
                        child: Icon(
                          Icons.home,
                          size: 24,
                          color: navProvider.currentTab == HomePageView
                              ? Colors.red
                              : Colors.grey,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          if(navProvider.currentTab != ShopPageView){
                            navProvider.navigateToPage(context, ShopPageView);
                          }
                        },
                        child: Icon(
                          Icons.shop,
                          size: 24,
                          color: navProvider.currentTab == ShopPageView
                              ? Colors.red
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: (){
                if(navProvider.currentTab != LocationPageView){
                  navProvider.navigateToPage(context, LocationPageView);
                }
              },
              child: Icon(
                Icons.location_on,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Arc(
                height: 18,
                arcType: ArcType.CONVEY,
                edge: Edge.LEFT,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 24),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(0.1, 0.1),
                      ),
                      BoxShadow(
                        blurRadius: 2,
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(-0.1, -0.1),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          if(navProvider.currentTab != BrandPageView){
                            navProvider.navigateToPage(context, BrandPageView);
                          }
                        },
                        child: Icon(
                          Icons.shopping_basket,
                          size: 24,
                          color: navProvider.currentTab == BrandPageView
                              ? Colors.red
                              : Colors.grey,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Icon(
                          Icons.person,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
