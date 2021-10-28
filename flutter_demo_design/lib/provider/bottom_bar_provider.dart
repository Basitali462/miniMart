import 'package:flutter/material.dart';
import 'package:flutter_demo_design/config/routes/route_constants.dart';

class BottomBarProvider with ChangeNotifier{
  String currentTab = HomePageView;

  void navigateToPage(BuildContext context, String name){
    currentTab = name;
    Navigator.pushNamed(context, name);
    notifyListeners();
  }
}