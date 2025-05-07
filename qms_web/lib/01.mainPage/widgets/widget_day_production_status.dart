import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:qms_web/util/util_color.dart';
import 'package:qms_web/util/util_text.dart';

class WidgetDayProductionStatus extends StatefulWidget {
  const WidgetDayProductionStatus({super.key});

  @override
  State<WidgetDayProductionStatus> createState() =>
      _WidgetDayProductionStatusState();
}

class _WidgetDayProductionStatusState extends State<WidgetDayProductionStatus> {
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
    final day = rawDate.substring(6, 8);
    return "$year.$month.$day";
  }

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Center(child: CircularProgressIndicator()); // 로딩 중 표시
    }

    final iEntWeight =
        double.tryParse(data['dayProduct']['iEntWeight'].toString()) ?? 0.0;
    final iDivEntWeiget = iEntWeight / 1000;

    final iDelSumWeight =
        double.tryParse(data['dayProduct']['iDelSumWeight'].toString()) ?? 0.0;
    final iDivDelWeiget = iDelSumWeight / 1000;

    final iDelErrorWeight =
        double.tryParse(data['dayProduct']['iDelErrorWeight'].toString()) ?? 0.0;
    final iDivDelErrorWeight = iDelErrorWeight / 1000;

    final iTmTime =
        double.tryParse(data['dayProduct']['iTmTime'].toString()) ?? 0.0;
    double iTonHour = 0.0;
    if (iEntWeight != 0) {
      iTonHour = (iDelSumWeight / iTmTime) * 60 / 1000;
    }

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
              // ...data.map((item) {
              //   String cDate = item['cDate'].toString();
              //   String formattedDate = formatDate(cDate); // 결과: 2025.04.21
              //   return Text(
              //     "일 생산 현황 $formattedDate",
              //     style: UtilText.get20(context, UtilColor.blue40),
              //   );
              // }),
              if (data['dayProduct'] != null)
                Text(
                  "일 생산 현황 ${formatDate(data['dayProduct']['cDate'])}",
                  style: UtilText.get20(context, UtilColor.blue40),
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
                                // ...data.map((item) {
                                //   final iEntWeight =
                                //       double.tryParse(
                                //         item['iEntWeight'].toString(),
                                //       ) ??
                                //       0.0;
                                //   final iDivEntWeiget = iEntWeight / 1000;
                                //   return Text(
                                //     formatter.format(iDivEntWeiget),
                                //     style: UtilText.get13(
                                //       context,
                                //       Colors.white,
                                //     ),
                                //   );
                                // }),
                                if (data['dayProduct'] != null)
                                  Text(
                                    formatter.format(iDivEntWeiget),
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
                            "생산량",
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
                                // ...data.map((item) {
                                //   final iEntWeight =
                                //       double.tryParse(
                                //         item['iDelSumWeight'].toString(),
                                //       ) ??
                                //       0.0;
                                //   final iDivEntWeiget = iEntWeight / 1000;
                                //   return Text(
                                //     formatter.format(iDivEntWeiget),
                                //     style: UtilText.get13(
                                //       context,
                                //       Colors.white,
                                //     ),
                                //   );
                                // }),
                                if (data['dayProduct'] != null)
                                  Text(
                                    formatter.format(iDivDelWeiget),
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
                            "불량량",
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
                                // ...data.map((item) {
                                //   final iDelErrorWeight =
                                //       double.tryParse(
                                //         item['iDelErrorWeight'].toString(),
                                //       ) ??
                                //       0.0;
                                //   final iDivDelErrorWeight =
                                //       iDelErrorWeight / 1000;
                                //   return Text(
                                //     formatter.format(iDivDelErrorWeight),
                                //     style: UtilText.get13(
                                //       context,
                                //       Colors.white,
                                //     ),
                                //   );
                                // }),
                                if (data['dayProduct'] != null)
                                  Text(
                                    formatter.format(iDivDelErrorWeight),
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
                            "T/H",
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
                                // ...data.map((item) {
                                //   final iDelSumWeight =
                                //       double.tryParse(
                                //         item['iDelSumWeight'].toString(),
                                //       ) ??
                                //       0.0;
                                //   final iEntWeight =
                                //       double.tryParse(
                                //         item['iTmTime'].toString(),
                                //       ) ??
                                //       0.0;
                                //   double iDivEntWeight = 0.0;
                                //   if (iEntWeight != 0) {
                                //     iDivEntWeight =
                                //         (iDelSumWeight / iEntWeight) *
                                //         60 /
                                //         1000;
                                //   }
                                //   return Text(
                                //     formatter.format(iDivEntWeight),
                                //     style: UtilText.get13(
                                //       context,
                                //       Colors.white,
                                //     ),
                                //   );
                                // }),
                                if (data['dayProduct'] != null)
                                  Text(
                                    formatter.format(iTonHour),
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
