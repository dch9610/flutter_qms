import 'package:flutter/material.dart';
import 'package:qms_web/util/util_color.dart';
import 'package:qms_web/util/util_text.dart';

class WidgetMainStopInformation extends StatelessWidget {
  const WidgetMainStopInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 8, 0),
        child: Container(
          width: 300,
          height: 330,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: CustomColor.primary600Color),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
                      child: Container(
                        width: 4,
                        height: 15,
                        decoration: BoxDecoration(color: Colors.blue),
                      ),
                    ),
                    Text(
                      "PLTCM STOP INFORMATION",
                      style: UtilText.get15(
                        context,
                        UtilityColor.primaryTextColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(width: 10,),
                      Expanded(flex: 4, child: Text("DATE",textAlign: TextAlign.center,)),
                      Expanded(flex: 4, child: Text("TIME",textAlign: TextAlign.center,)),
                      Expanded(flex: 8, child: Text("휴지",textAlign: TextAlign.center,)),
                      Expanded(flex: 4, child: Text("사유",textAlign: TextAlign.center,)),
                      Expanded(flex: 8, child: Text("소분류",textAlign: TextAlign.center,)),
                      ],
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
