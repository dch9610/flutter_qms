import 'package:flutter/material.dart';

class VerticalDividerLine extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final EdgeInsetsGeometry padding;

  const VerticalDividerLine({
    this.height = 25,
    this.width = 1,
    this.color = Colors.black,
    this.padding = const EdgeInsetsDirectional.only(end: 30),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: color),
      ),
    );
  }
}
