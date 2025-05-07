import 'package:flutter/material.dart';
import 'package:qms_web/util/util_color.dart';
import 'package:qms_web/util/util_text.dart';

class WidgetMainData extends StatelessWidget {
  const WidgetMainData({
    super.key,
    required this.loactionName,
    required this.lineSpeed,
  });

  final String loactionName;
  final String lineSpeed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        child: Container(
          width: 220,
          decoration: BoxDecoration(
            color: UtilityColor.secondaryBackgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue),
          ),

          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lineSpeed,
                  style: UtilText.get20(context, UtilityColor.primaryTextColor),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: Text(
                    loactionName,
                    style: UtilText.get11(
                      context,
                      UtilityColor.primaryTextColor,
                    ),
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
