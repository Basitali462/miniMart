import 'package:flutter/material.dart';
import 'package:flutter_demo_design/config/components/app_bar.dart';
import 'package:flutter_demo_design/config/components/bottom_nav_bar.dart';
import 'package:flutter_demo_design/config/components/search_bar.dart';

class ShopsPage extends StatelessWidget {
  Widget shopsTitle(){
    return Row(
      children: [
        Text(
          'Shops Nearby',
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
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(showLocation: true,),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
            child: Column(
              children: [
                SearchBar(hintText: 'Search for shops',),
                SizedBox(height: 20,),
                shopsTitle(),
                SizedBox(height: 30,),
                Expanded(
                  child: Container(
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 12,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5
                      ),
                      itemBuilder: (context, index){
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
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
                          margin: EdgeInsets.all(4),
                          padding: EdgeInsets.all(8),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Image.asset(
                              'assets/jaya_groccer.png',
                            ),
                          ),
                        );
                      },),
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
