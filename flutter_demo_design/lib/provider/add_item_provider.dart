import 'package:flutter/material.dart';

class AddItemProvider with ChangeNotifier{
  List<String> categoryList = ['Fruit', 'Vegetables'];
  String selectedCategory;

  onCategoryChanged(String val){
    selectedCategory = val;
    notifyListeners();
  }
}