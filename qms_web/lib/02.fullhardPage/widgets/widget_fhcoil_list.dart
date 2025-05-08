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

  int currentPage = 0;
  int itemsPerPage = 13;

  void _setPage(int page) {
    setState(() {
      currentPage = page;
    });
  }

  void _nextPage() {
    if ((currentPage + 1) * itemsPerPage < coilList.length) {
      setState(() => currentPage++);
    }
  }

  void _previousPage() {
    if (currentPage > 0) {
      setState(() => currentPage--);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screendHeight = MediaQuery.of(context).size.height;
    int newItemsPerPage = screendHeight <= 800 ? 13 : 18; // 화면 크기 변경에 따른 데이터 표시 갯수 조정
    int totalPages = (coilList.length / itemsPerPage).ceil();

    // 작은 화면에서 큰 화면으로 이동시 RangeError 방지 
    if (newItemsPerPage != itemsPerPage) {
      setState(() {
        itemsPerPage = newItemsPerPage;

        // 총 페이지 수 계산
        totalPages = (coilList.length / itemsPerPage).ceil();

        // currentPage가 범위를 넘지 않도록 조정
        if (currentPage >= totalPages) {
          currentPage = totalPages > 0 ? totalPages - 1 : 0;
        }
      });
    }


    int startIndex = currentPage * itemsPerPage;
    int endIndex =
        (startIndex + itemsPerPage) > coilList.length
            ? coilList.length
            : startIndex + itemsPerPage; // 데이터 갯수도 다시 변경되도록 수정정

    final visibleItems = coilList.sublist(startIndex, endIndex);

    return Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
        child: Builder(
          builder: (context) {
            final screenHeight = MediaQuery.of(context).size.height;
            final containerHeight = screenHeight * 0.7;
            return Column(
              children: [
                Container(
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
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              0,
                              10,
                              0,
                              0,
                            ),
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  16,
                                  0,
                                  16,
                                  0,
                                ),
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
                                      flex: 4,
                                      child: Text(
                                        '작업시간 (분)',
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
                            itemCount: visibleItems.length,
                            itemBuilder: (context, index) {
                              if (coilList.isNotEmpty) {
                                final coil = visibleItems[index];
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

                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: _previousPage,
                        icon: Icon(Icons.chevron_left),
                      ),

                      ...List.generate(totalPages, (index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  index == currentPage
                                      ? Colors.blue
                                      : Colors.grey[300],
                              foregroundColor:
                                  index == currentPage
                                      ? Colors.white
                                      : Colors.black,
                              minimumSize: Size(40, 36),
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () => _setPage(index),
                            child: Text('${index + 1}'),
                          ),
                        );
                      }),
                      IconButton(
                        onPressed: _nextPage,
                        icon: Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
