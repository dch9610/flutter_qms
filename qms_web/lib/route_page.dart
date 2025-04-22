import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class RoutePage {
  static const main = "/";

  static movePage(BuildContext context, String routeName) {
    context.beamToNamed(routeName);
  }

  static backPage(BuildContext context) {
    context.beamBack();
  }
}
