import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:qms_web/util/util_color.dart';
import 'package:qms_web/util/util_text.dart';

class WidgetMonthProductionStatus extends StatefulWidget {
  const WidgetMonthProductionStatus({super.key});

  @override
  State<WidgetMonthProductionStatus> createState() =>
      _WidgetDayProductionStatusState();
}

class _WidgetDayProductionStatusState
    extends State<WidgetMonthProductionStatus> {
  Map<String, dynamic> data = {};

  Future<void> fetchData() async {
    http.Response response = await http.get(
      Uri.parse("http://localhost:8080/model/main_production.php"),
    );

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  String formatDate(String rawDate) {
    if (rawDate.length != 8) return rawDate;
    final year = rawDate.substring(0, 4);
    final month = rawDate.substring(4, 6);

    return "$year.$month";
  }

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Center(child: CircularProgressIndicator()); // 로딩 중 표시
    }

    final iCurEntWeightSum =
        double.tryParse(data['curMonthProduct']['iEntWeightSum'].toString()) ??
        0.0;
    final iCurDivEntWeight = iCurEntWeightSum / 1000;

    final iCurDelWeightSum =
        double.tryParse(data['curMonthProduct']['iDelWeightSum'].toString()) ??
        0.0;
    final iCurDivDelWeight = iCurDelWeightSum / 1000;


    final iPreEntWeightSum =
        double.tryParse(data['preMonthProduct']['iEntWeightSum'].toString()) ??
        0.0;
    final iPreDivEntWeight = iPreEntWeightSum / 1000;

    final iPreDelWeightSum =
        double.tryParse(data['preMonthProduct']['iDelWeightSum'].toString()) ??
        0.0;
    final iPreDivDelWeight = iPreDelWeightSum / 1000;

    final formatter = NumberFormat("#,##0.000");

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(4, 16, 4, 0),
      child: Container(
        width: 300,
        height: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: CustomColor.primary600Color),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(width: 30),
                  Text(
                    "월 생산 현황",
                    style: UtilText.get20(context, UtilColor.blue40),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.1,
                  ),
                  scrollDirection: Axis.vertical,

                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(),
                      child: Column(
                        // mainAxisSize: MainAxisSize.max,
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
                            "당월 투입량",
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
                                if (data['curMonthProduct'] != null)
                                  Text(
                                    formatter.format(iCurDivEntWeight),
                                    style: UtilText.get13(
                                      context,
                                      UtilityColor.secondaryBackgroundColor,
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
                            "당월 생산량",
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
                                if (data['curMonthProduct'] != null)
                                  Text(
                                    formatter.format(iCurDivDelWeight),
                                    style: UtilText.get13(
                                      context,
                                      UtilityColor.secondaryBackgroundColor,
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
                            "전월 투입량",
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
                                if (data['curMonthProduct'] != null)
                                  Text(
                                    formatter.format(iPreDivEntWeight),
                                    style: UtilText.get13(
                                      context,
                                      UtilityColor.secondaryBackgroundColor,
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
                            "전월 생산량",
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
                              children: [if (data['curMonthProduct'] != null)
                                  Text(
                                    formatter.format(iPreDivDelWeight),
                                    style: UtilText.get13(
                                      context,
                                      UtilityColor.secondaryBackgroundColor,
                                    ),
                                  ),],
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
    );
  }
}
