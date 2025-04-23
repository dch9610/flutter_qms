import 'package:flutter/material.dart';
import 'package:qms_web/01.mainPage/widgets/widget_main_data.dart';
import 'package:qms_web/util/util_color.dart';
import 'package:qms_web/util/util_text.dart';

class WidgetMainDatacard extends StatelessWidget {
  const WidgetMainDatacard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(4, 16, 4, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey,
          boxShadow: [
            BoxShadow(blurRadius: 3, color: Colors.grey, offset: Offset(0, 1)),
          ],
          borderRadius: BorderRadius.circular(12),
        ),

        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "PLTCM LINE STATE",
                style: UtilText.get20(context, UtilityColor.primaryTextColor),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                    child: Container(
                      width: 4,
                      height: 15,
                      decoration: BoxDecoration(
                        color: CustomColor.primaryBtnTextColor,
                      ),
                    ),
                  ),
                  Text(
                    "LINE SPEED",
                    style: UtilText.get15(
                      context,
                      UtilityColor.primaryTextColor,
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    WidgetMainData(loactionName: "TCM EXIT", lineSpeed: "160"),
                    WidgetMainData(loactionName: "TCM ENTRY", lineSpeed: "160"),
                    WidgetMainData(loactionName: "PL EXIT", lineSpeed: "160"),
                    WidgetMainData(loactionName: "PL CENTER", lineSpeed: "160"),
                    WidgetMainData(loactionName: "PL ENTRY", lineSpeed: "160"),
                  ],
                ),
              ),

              const SizedBox(height: 40),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                    child: Container(
                      width: 4,
                      height: 15,
                      decoration: BoxDecoration(
                        color: CustomColor.primaryBtnTextColor,
                      ),
                    ),
                  ),
                  Text(
                    "TCM INFORMATION",
                    style: UtilText.get15(
                      context,
                      UtilityColor.primaryTextColor,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                child: Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: UtilityColor.secondaryBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 0,
                        color: CustomColor.lineColor,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 10,
                              child: Text(
                                "CURRENT",
                                textAlign: TextAlign.center,
                                style: UtilText.get20(
                                  context,
                                  UtilityColor.primaryTextColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                0,
                                0,
                                30,
                                0,
                              ),
                              child: Container(
                                width: 1,
                                height: 25,
                                decoration: BoxDecoration(color: Colors.black),
                              ),
                            ),
                            Expanded(flex: 30, child: Text("data")),
                          ],
                        ),

                        // const SizedBox(height: 10,),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                          child: Container(
                            width: double.infinity,
                            height: 1,
                            decoration: BoxDecoration(color: Colors.black),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 10,
                              child: Text(
                                "NEXT",
                                textAlign: TextAlign.center,
                                style: UtilText.get20(
                                  context,
                                  UtilityColor.primaryTextColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                0,
                                0,
                                30,
                                0,
                              ),
                              child: Container(
                                width: 1,
                                height: 25,
                                decoration: BoxDecoration(color: Colors.black),
                              ),
                            ),
                            Expanded(flex: 30, child: Text("data")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
