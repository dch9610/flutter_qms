import 'package:flutter/widgets.dart';
import 'package:qms_web/route_page.dart';

class UtilMenu {
  static final List<String> menuList = [
    "Main", "FH COIL 작업실적", "HOT COIL 작업실적", "생산실적", "ANALYSIS"
  ];

  static void changeIndex(BuildContext context, int index) {
    String routeName = "";

    switch (index) {
      case 0:
        routeName = RoutePage.main;
        break;

      case 1:
       
        break;

      case 2:
        break;
        
      case 3:
        break;
    }

    RoutePage.movePage(context, routeName);
  }
}
