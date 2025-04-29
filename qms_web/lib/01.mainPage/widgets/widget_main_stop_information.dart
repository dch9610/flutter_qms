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
                Text("일 생산현황"),
                const SizedBox(height: 10),

                Row(
                  children: [
                    Container(
                      width: 84,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 100,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                Expanded(
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    scrollDirection: Axis.vertical,

                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              alignment: AlignmentDirectional(0, 0),
                              child: Icon(
                                Icons.factory,
                                color: CustomColor.secondary600Color,
                                size: 24,
                              ),
                            ),
                            const SizedBox(height: 5),

                            Text(
                              "투입량",
                              style: UtilText.get15(
                                context,
                                UtilityColor.primaryTextColor,
                              ),
                            ),
                            const SizedBox(height: 5),

                            Container(
                              height: 36,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              alignment: AlignmentDirectional(0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "1000",
                                    style: UtilText.get13(
                                      context,
                                      UtilityColor.primaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              alignment: AlignmentDirectional(0, 0),
                              child: Icon(
                                Icons.factory,
                                color: CustomColor.secondary600Color,
                                size: 24,
                              ),
                            ),
                            const SizedBox(height: 5),

                            Text(
                              "투입량",
                              style: UtilText.get15(
                                context,
                                UtilityColor.primaryTextColor,
                              ),
                            ),
                            const SizedBox(height: 5),

                            Container(
                              height: 36,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              alignment: AlignmentDirectional(0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "1000",
                                    style: UtilText.get13(
                                      context,
                                      UtilityColor.primaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              alignment: AlignmentDirectional(0, 0),
                              child: Icon(
                                Icons.factory,
                                color: CustomColor.secondary600Color,
                                size: 24,
                              ),
                            ),
                            const SizedBox(height: 5),

                            Text(
                              "투입량",
                              style: UtilText.get15(
                                context,
                                UtilityColor.primaryTextColor,
                              ),
                            ),
                            const SizedBox(height: 5),

                            Container(
                              height: 36,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              alignment: AlignmentDirectional(0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "1000",
                                    style: UtilText.get13(
                                      context,
                                      UtilityColor.primaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              alignment: AlignmentDirectional(0, 0),
                              child: Icon(
                                Icons.factory,
                                color: CustomColor.secondary600Color,
                                size: 24,
                              ),
                            ),
                            const SizedBox(height: 5),

                            Text(
                              "투입량",
                              style: UtilText.get15(
                                context,
                                UtilityColor.primaryTextColor,
                              ),
                            ),
                            const SizedBox(height: 5),

                            Container(
                              height: 36,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              alignment: AlignmentDirectional(0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "1000",
                                    style: UtilText.get13(
                                      context,
                                      UtilityColor.primaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
