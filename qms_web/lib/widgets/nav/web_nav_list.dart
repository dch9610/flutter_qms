import 'package:flutter/material.dart';
import 'package:qms_web/util/util_color.dart';
import 'package:qms_web/util/util_menu.dart';

class WebNavList extends StatelessWidget {
  const WebNavList({
    super.key,
    required this.navName,
    required this.icon,
    required this.index,
    required this.textStyle,
    required this.padding,
  });

  final String navName;
  final Icon icon;
  final int index;
  final TextStyle textStyle;
  final Padding padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
      child: InkWell(
        onTap: () {
          UtilMenu.changeIndex(context, index);
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: CustomColor.backgroundColor,
            borderRadius: BorderRadius.circular(0),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                padding,

                icon,
                // Icon(icon, color: Colors.green, size: 28),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Text(navName, style: textStyle),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
