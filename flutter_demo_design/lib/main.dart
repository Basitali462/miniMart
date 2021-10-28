import 'package:flutter/material.dart';
import 'package:flutter_demo_design/config/routes/router.dart';
import 'package:flutter_demo_design/config/services/sheet_api.dart';
import 'package:flutter_demo_design/config/theme/app_theme.dart';
import 'package:flutter_demo_design/pages/home_page.dart';
import 'package:flutter_demo_design/provider/add_item_provider.dart';
import 'package:flutter_demo_design/provider/bottom_bar_provider.dart';
import 'package:flutter_demo_design/provider/category_change_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_demo_design/config/routes/router.dart' as router;

import 'config/routes/route_constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SheetApi.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => BottomBarProvider()),
        ChangeNotifierProvider(create: (_) => AddItemProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.theme,
        home: HomePage(),
        initialRoute: HomePageView,
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
