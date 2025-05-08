import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qms_web/02.fullhardPage/widgets/widget_fhcoil_value.dart';
import 'package:qms_web/util/util_color.dart';
import 'package:qms_web/util/util_text.dart';

class WidgetFhcoilList extends StatefulWidget {
  const WidgetFhcoilList({super.key});

  @override
  State<WidgetFhcoilList> createState() => _WidgetFhcoilListState();
}

class _WidgetFhcoilListState extends State<WidgetFhcoilList> {
  List<dynamic> coilList = []; // 리스트로 선언해야 함

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse("http://localhost:8080/model/model_fhcoilresult.php"),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        coilList = jsonData["fhCoilResult"] ?? [];
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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
        child: Builder(
          builder: (context) {
            final screenHeight = MediaQuery.of(context).size.height;
            final containerHeight = screenHeight * 0.65;
            return Container(
              width: double.infinity,
              height: containerHeight,
              constraints: BoxConstraints(maxWidth: 1500),
              decoration: BoxDecoration(
                color: UtilityColor.secondaryBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Color(0x33000000),
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: UtilityColor.secondaryTextColor),
              ),

              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            color: UtilityColor.primaryBackgroundColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    'L3 COILNO',
                                    textAlign: TextAlign.center,
                                    style: UtilText.get18(
                                      context,
                                      UtilityColor.primaryTextColor,
                                    ),
                                  ),
                                ),
                
                                VerticalDivider(),
                
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    'L2 COILNO',
                                    textAlign: TextAlign.center,
                                    style: UtilText.get18(
                                      context,
                                      UtilityColor.primaryTextColor,
                                    ),
                                  ),
                                ),
                                VerticalDivider(),
                                Expanded(
                                  flex: 6,
                                  child: Text(
                                    '종료 시각',
                                    textAlign: TextAlign.center,
                                    style: UtilText.get18(
                                      context,
                                      UtilityColor.primaryTextColor,
                                    ),
                                  ),
                                ),
                                VerticalDivider(),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '작업시간',
                                    textAlign: TextAlign.center,
                                    style: UtilText.get18(
                                      context,
                                      UtilityColor.primaryTextColor,
                                    ),
                                  ),
                                ),
                                VerticalDivider(),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'S/G',
                                    textAlign: TextAlign.center,
                                    style: UtilText.get18(
                                      context,
                                      UtilityColor.primaryTextColor,
                                    ),
                                  ),
                                ),
                                VerticalDivider(),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '차공정',
                                    textAlign: TextAlign.center,
                                    style: UtilText.get18(
                                      context,
                                      UtilityColor.primaryTextColor,
                                    ),
                                  ),
                                ),
                                VerticalDivider(),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '폭(入)',
                                    textAlign: TextAlign.center,
                                    style: UtilText.get18(
                                      context,
                                      UtilityColor.primaryTextColor,
                                    ),
                                  ),
                                ),
                                VerticalDivider(),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '두께(入)',
                                    textAlign: TextAlign.center,
                                    style: UtilText.get18(
                                      context,
                                      UtilityColor.primaryTextColor,
                                    ),
                                  ),
                                ),
                                VerticalDivider(),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '폭(出)',
                                    textAlign: TextAlign.center,
                                    style: UtilText.get18(
                                      context,
                                      UtilityColor.primaryTextColor,
                                    ),
                                  ),
                                ),
                                VerticalDivider(),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '두께(出)',
                                    textAlign: TextAlign.center,
                                    style: UtilText.get18(
                                      context,
                                      UtilityColor.primaryTextColor,
                                    ),
                                  ),
                                ),
                                VerticalDivider(),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '길이',
                                    textAlign: TextAlign.center,
                                    style: UtilText.get18(
                                      context,
                                      UtilityColor.primaryTextColor,
                                    ),
                                  ),
                                ),
                                VerticalDivider(),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '출측 중량',
                                    textAlign: TextAlign.center,
                                    style: UtilText.get18(
                                      context,
                                      UtilityColor.primaryTextColor,
                                    ),
                                  ),
                                ),
                                VerticalDivider(),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    '상태',
                                    textAlign: TextAlign.center,
                                    style: UtilText.get18(
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
                
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          if (coilList.isNotEmpty) {
                            final coil = coilList[index];
                            return WidgetFhcoilValue(
                              cL3FHCoilNo: coil['cL3FHCoilNo'],
                              cFHCoilNo: coil['cFHCoilNo'],
                              cEndTime: coil['cEndTime'],
                              iProcTime: coil['iProcTime'],
                              cSteelGrade: coil['cSteelGrade'],
                              cNextProc: coil['cNextProc'],
                              iHotWidth00: coil['iHotWidth00'],
                              iHotThick00: coil['iHotThick00'],
                              iActWidth: coil['iActWidth'],
                              iActThk: coil['iActThk'],
                              iClaLength: coil['iClaLength'],
                              iActWeight: coil['iActWeight'],
                              cCoilStatus: coil['cCoilStatus'],
                            );
                          } else {
                            return Text("");
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
