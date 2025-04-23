import 'package:flutter/material.dart';
import 'package:qms_web/route_page.dart';

class MenuItem {
  final String title;
  final IconData icon;

  MenuItem({
    required this.title,
    required this.icon,
  });
}

class UtilMenu {

    static final List<MenuItem> menuItems = [
    MenuItem(title: "MAIN", icon: Icons.home_filled),
    MenuItem(title: "FH COIL 작업실적", icon: Icons.factory_rounded),
    MenuItem(title: "HOT COIL 작업실적", icon: Icons.factory_outlined),
    MenuItem(title: "생산실적", icon: Icons.featured_play_list),
    MenuItem(title: "ANALYSIS", icon: Icons.analytics),
    MenuItem(title: "의뢰/요청 게시판", icon: Icons.wifi_tethering_error_rounded),
    // 필요에 따라 더 추가
  ];

  static void changeIndex(BuildContext context, int index) {
    String routeName = "";

    switch (index) {
      case 0:
        routeName = RoutePage.main;
        break;

      case 1:
        routeName = RoutePage.fullhardcoilperformance;
        break;

      case 2:
        routeName = RoutePage.hotcoilperformance;
        break;

      case 3:
        routeName = RoutePage.productperformance;
        break;

      case 4:
        routeName = RoutePage.analysis;
        break;

      case 5:
        routeName = RoutePage.requestboard;
        break;
    }

    RoutePage.movePage(context, routeName);
  }
}
