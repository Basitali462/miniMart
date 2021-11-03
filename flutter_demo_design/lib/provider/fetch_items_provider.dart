import 'package:flutter/material.dart';
import 'package:flutter_demo_design/config/models/items_model.dart';

class FetchItemProvider with ChangeNotifier{
  List<ItemsModel> allItems = [];
  List<ItemsModel> itemToDisplay = [];
  /*List<ItemsModel> fruitItems = [];
  List<ItemsModel> veggieItems = [];
  List<ItemsModel> dairyItems = [];
  List<ItemsModel> meatItems = [];*/

  void setCategoryItemToShow(String name){
    if(allItems.isEmpty) return ;
    if(name == 'Fruits'){
      getFruits();
    }else if(name == 'Veggies'){
      getVeggie();
    }else if(name == 'Dairy'){
      getDairy();
    }else if(name == 'Meat'){
      getMeat();
    }else{
      return ;
    }
    notifyListeners();
  }

  void fetchAllItems(List<ItemsModel> items){
    allItems = items;
    notifyListeners();
  }

  void addNewItem(ItemsModel item){
    allItems.add(item);
    notifyListeners();
  }

  void getFruits(){
    itemToDisplay.clear();
    for(int i = 0; i < allItems.length; i++){
      if(allItems[i].category == 'Fruits'){
        itemToDisplay.add(allItems[i]);
      }
    }
  }

  void getVeggie(){
    itemToDisplay.clear();
    for(int i = 0; i < allItems.length; i++){
      if(allItems[i].category == 'Veggies'){
        itemToDisplay.add(allItems[i]);
      }
    }
  }

  void getDairy(){
    itemToDisplay.clear();
    for(int i = 0; i < allItems.length; i++){
      if(allItems[i].category == 'Dairy'){
        itemToDisplay.add(allItems[i]);
      }
    }
  }

  void getMeat(){
    itemToDisplay.clear();
    for(int i = 0; i < allItems.length; i++){
      if(allItems[i].category == 'Meat'){
        itemToDisplay.add(allItems[i]);
      }
    }
  }
}