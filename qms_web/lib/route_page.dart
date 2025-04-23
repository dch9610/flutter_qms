import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class RoutePage {
  static const main = "/";
  static const fullhardcoilperformance = "/fullhardcoilperformance";
  static const hotcoilperformance = "/hotcoilperformance";
  static const productperformance = "/productperformance";
  static const analysis = "/analysis";
  static const requestboard = "/requestboard";

  static movePage(BuildContext context, String routeName) {
    context.beamToNamed(routeName);
  }

  static backPage(BuildContext context) {
    context.beamBack();
  }
}
