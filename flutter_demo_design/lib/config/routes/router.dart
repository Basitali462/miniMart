import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_design/config/routes/route_constants.dart';
import 'package:flutter_demo_design/pages/available_brands.dart';
import 'package:flutter_demo_design/pages/home_page.dart';
import 'package:flutter_demo_design/pages/select_location.dart';
import 'package:flutter_demo_design/pages/shops.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case HomePageView:
      return MaterialPageRoute(builder: (context) => HomePage());
    case LocationPageView:
      return MaterialPageRoute(builder: (context) => SelectLocationPage());
    case BrandPageView:
      return MaterialPageRoute(builder: (context) => AvailableBrands());
    case ShopPageView:
      return MaterialPageRoute(builder: (context) => ShopsPage());
    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}