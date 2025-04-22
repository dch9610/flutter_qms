import 'package:flutter/material.dart';
import 'package:qms_web/util/util_text.dart';

class WebNavList extends StatelessWidget {
  const WebNavList({super.key, required this.navName, required this.icon});

  final String navName;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(0),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                  child: Container(
                    width: 4,
                    height: 100,
                    decoration: BoxDecoration(color: Colors.blue),
                  ),
                ),
                icon,
                // Icon(icon, color: Colors.green, size: 28),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 5, 0, 0),
                  child: Text(
                    navName,
                    style: UtilText.get20(context, Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
