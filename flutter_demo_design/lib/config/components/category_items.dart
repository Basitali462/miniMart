import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_demo_design/config/components/popup/product_detail_popupp.dart';
import 'package:flutter_demo_design/config/models/items_model.dart';
import 'package:flutter_demo_design/provider/category_change_provider.dart';

class CategoryListItems extends StatefulWidget {
  final CategoryProvider provider;
  final ItemsModel item;

  CategoryListItems({this.provider, this.item});

  @override
  _CategoryListItemsState createState() => _CategoryListItemsState();
}

class _CategoryListItemsState extends State<CategoryListItems> {
  Uint8List imageBytes;
  String imageData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
      if(widget.item.image != null || widget.item.image.isNotEmpty){
        setState(() {
          print('converting image');
          //imageData = base64Encode(widget.item.image)
          imageBytes = base64Decode(widget.item.image);
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
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
          child: Image.memory(
            imageBytes,
            width: 20,
            height: 20,
          ),
          /*Image.asset(
            widget.item.image,
            width: 20,
            height: 20,
          ),*/
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
  }
}
