import 'package:flutter/material.dart';
import 'package:flutter_demo_design/pages/add_item_page/add_items.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(height: 48,),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return AddItems();
              }));
            },
            child: ListTile(
              //contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.add,
              ),
              title: Text(
                'Add Item',
                style: TextStyle(

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
