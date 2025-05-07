import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:qms_web/01.mainPage/widgets/widget_main_data.dart';
import 'package:qms_web/util/util_color.dart';
import 'package:qms_web/util/util_text.dart';

class WidgetMainDatacard extends StatefulWidget {
  const WidgetMainDatacard({super.key});

  @override
  State<WidgetMainDatacard> createState() => _WidgetMainDatacardState();
}

class _WidgetMainDatacardState extends State<WidgetMainDatacard> {
  Timer? _reTimer;
  Timer? _secondTimer;
  int _seconds = 10;
  Map<String, dynamic> data = {};

  Future<void> fetchData() async {
    http.Response response = await http.get(
      Uri.parse("http://localhost:8080/model/main/main_production.php"),
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
    // 10초마다 setState 실행
    _reTimer = Timer.periodic(Duration(seconds: 10), (timer) {
      fetchData();
    });
    _secondTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds--;
        if (_seconds == 0) {
          _seconds = 10; // 0초 넘어가면 다시 10초로 리셋
        }
      });
    });
  }

  @override
  void dispose() {
    _reTimer?.cancel(); // 타이머 정리
    _secondTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Center(child: CircularProgressIndicator()); // 로딩 중 표시
    }

    final formatter = NumberFormat("#,##0");
    // 소수점 3자리 포맷
    final formatterThree = NumberFormat("#,##0.000");

    final iTRSpeed =
        double.tryParse(data['LineSpeed']['iTRSpeed'].toString()) ?? 0.0;
    final iTRSpeedValue = (iTRSpeed / 10).toInt();

    final i6BRSpeed =
        double.tryParse(data['LineSpeed']['i6BRSpeed'].toString()) ?? 0.0;
    final i6BRSpeedValue = (i6BRSpeed / 10).toInt();

    final iSTSpeed =
        double.tryParse(data['LineSpeed']['iSTSpeed'].toString()) ?? 0.0;
    final iSTSpeedValue = (iSTSpeed / 10).toInt();

    final iPLSpeed =
        int.tryParse(data['LineSpeed']['iPLSpeed'].toString()) ?? 0.0;
    final iPLSpeedValue = (iPLSpeed / 10).toInt();

    final iEntSpeed =
        int.tryParse(data['LineSpeed']['iEntSpeed'].toString()) ?? 0.0;
    final iEntSpeedValue = (iEntSpeed / 10).toInt();

    final cCurrentCoilNo =
        (data["Current"]["cCoilNo"]?.toString().trim().isEmpty ?? true)
            ? null
            : data["Current"]["cCoilNo"];

    final iCurrentiThick =
        double.tryParse(data['Current']['iThick'].toString()) ?? 0.0;
    final iCurrentiThickValue = formatterThree.format(
      (iCurrentiThick / 1000).toDouble(),
    );

    final iCurrentiTarThick =
        double.tryParse(data['Current']['iTarThick'].toString()) ?? 0.0;
    final iCurrentiTarThickValue = formatterThree.format(
      (iCurrentiTarThick / 1000).toDouble(),
    );

    final iCurrentiWidth =
        double.tryParse(data['Current']['iWidth'].toString()) ?? 0.0;
    final iCurrentiWidthkValue = formatter.format(iCurrentiWidth);

    final iCurrentiTarWidth =
        double.tryParse(data['Current']['iTarWidth'].toString()) ?? 0.0;
    final iCurrentiTarWidthValue = formatter.format(iCurrentiTarWidth);

    final cNextCoilNo =
        (data["Next"] != null &&
                data["Next"]["cCoilNo"] != null &&
                data["Next"]["cCoilNo"].toString().trim().isNotEmpty)
            ? data["Next"]["cCoilNo"]
            : null;

    final iNextiThick =
        (data['Next'] != null && data['Next']['iThick'] != null)
            ? double.tryParse(data['Next']['iThick'].toString()) ?? 0.0
            : 0.0;

    final iNextiThickValue = formatterThree.format(
      (iNextiThick / 1000).toDouble(),
    );

    final iNextiTarThick =
        (data['Next'] != null && data['Next']['iTarThick'] != null)
            ? double.tryParse(data['Next']['iTarThick'].toString()) ?? 0.0
            : 0.0;
    final iNextiTarThickValue = formatterThree.format(
      (iNextiTarThick / 1000).toDouble(),
    );

    final iNextiWidth =
        (data['Next'] != null && data['Next']['iWidth'] != null)
            ? double.tryParse(data['Next']['iWidth'].toString()) ?? 0.0
            : 0.0;
    final iNextiWidthValue = formatter.format(iNextiWidth);

    final iNextiTarWidth =
                (data['Next'] != null && data['Next']['iTarWidth'] != null)
            ? double.tryParse(data['Next']['iTarWidth'].toString()) ?? 0.0
            : 0.0;
    final iNextiTarWidthValue = formatter.format(iNextiTarWidth);

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
              Row(
                children: [
                  Text(
                    "PLTCM LINE STATE",
                    style: UtilText.get20(
                      context,
                      UtilityColor.primaryTextColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '($_seconds초)',
                    style: UtilText.get20(
                      context,
                      UtilityColor.primaryTextColor,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              // LINE SPEED
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
                    WidgetMainData(
                      loactionName: "TCM EXIT",
                      lineSpeed: formatter.format(iTRSpeedValue),
                    ),
                    WidgetMainData(
                      loactionName: "TCM ENTRY",
                      lineSpeed: formatter.format(i6BRSpeedValue),
                    ),
                    WidgetMainData(
                      loactionName: "PL EXIT",
                      lineSpeed: formatter.format(iSTSpeedValue),
                    ),
                    WidgetMainData(
                      loactionName: "PL CENTER",
                      lineSpeed: formatter.format(iPLSpeedValue),
                    ),
                    WidgetMainData(
                      loactionName: "PL ENTRY",
                      lineSpeed: formatter.format(iEntSpeedValue),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // TCM INFORMATION
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
                            Expanded(
                              flex: 30,
                              child:
                                  (cCurrentCoilNo == null)
                                      ? const SizedBox.shrink()
                                      : Text(
                                        "$cCurrentCoilNo : $iCurrentiThickValue -> $iCurrentiTarThickValue / $iCurrentiWidthkValue -> $iCurrentiTarWidthValue",
                                        style: UtilText.get15(
                                          context,
                                          UtilityColor.primaryTextColor,
                                        ),
                                      ),
                            ),
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

                        // TCM INFORMATION
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
                            Expanded(
                              flex: 30,
                              child:
                                  (cNextCoilNo == null)
                                      ? const SizedBox.shrink()
                                      : Text(
                                        "$cNextCoilNo : $iNextiThickValue -> $iNextiTarThickValue / $iNextiWidthValue -> $iNextiTarWidthValue",
                                        style: UtilText.get15(
                                          context,
                                          UtilityColor.primaryTextColor,
                                        ),
                                      ),
                            ),
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
