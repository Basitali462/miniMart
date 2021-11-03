import 'package:flutter/cupertino.dart';

class CategoryProvider with ChangeNotifier{
  int currentIndex = 0;
  bool shrinkTopList = false;
  String selectedCategory = 'assets/icons/fruits.png';
  String selectedCategoryName = 'Fruits';


  void changeIndex(int index){
    currentIndex = index;
    if(currentIndex % 4 == 0){
      selectedCategory = 'assets/icons/fruits.png';
      selectedCategoryName = 'Fruits';
    }else if(currentIndex % 4 == 1){
      selectedCategory = 'assets/icons/veggie.png';
      selectedCategoryName = 'Veggies';
    }else if(currentIndex % 4 == 2){
      selectedCategory = 'assets/icons/dairy.png';
      selectedCategoryName = 'Dairy';
    }else if(currentIndex % 4 == 3){
      selectedCategory = 'assets/icons/meat.png';
      selectedCategoryName = 'Meat';
    }
    print(selectedCategoryName);
    notifyListeners();
  }

  void onListScroll(bool shrinkStatus){
    shrinkTopList = shrinkStatus;
    notifyListeners();
  }
}