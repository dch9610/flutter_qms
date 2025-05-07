import 'package:flutter/material.dart';
import 'package:qms_web/util/util_color.dart';

class WidgetFhcoilList extends StatelessWidget {
  const WidgetFhcoilList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
        child: Container(
          width: double.infinity,
          height: 600,
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
                            ),
                          ),

                          VerticalDivider(),

                          Expanded(
                            flex: 4,
                            child: Text(
                              'L2 COILNO',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          VerticalDivider(),
                          Expanded(
                            flex: 6,
                            child: Text('종료 시각', textAlign: TextAlign.center),
                          ),
                          VerticalDivider(),
                          Expanded(
                            flex: 3,
                            child: Text('작업시간', textAlign: TextAlign.center),
                          ),
                          VerticalDivider(),
                          Expanded(
                            flex: 2,
                            child: Text('S/G', textAlign: TextAlign.center),
                          ),
                          VerticalDivider(),
                          Expanded(
                            flex: 3,
                            child: Text('차공정', textAlign: TextAlign.center),
                          ),
                          VerticalDivider(),
                          Expanded(
                            flex: 3,
                            child: Text('폭(入)', textAlign: TextAlign.center),
                          ),
                          VerticalDivider(),
                          Expanded(
                            flex: 3,
                            child: Text('두께(入)', textAlign: TextAlign.center),
                          ),
                          VerticalDivider(),
                          Expanded(
                            flex: 3,
                            child: Text('폭(出)', textAlign: TextAlign.center),
                          ),
                          VerticalDivider(),
                          Expanded(
                            flex: 3,
                            child: Text('두께(出)', textAlign: TextAlign.center),
                          ),
                          VerticalDivider(),
                          Expanded(
                            flex: 3,
                            child: Text('길이', textAlign: TextAlign.center),
                          ),
                          VerticalDivider(),
                          Expanded(
                            flex: 3,
                            child: Text('출측 중량', textAlign: TextAlign.center),
                          ),
                          VerticalDivider(),
                          Expanded(
                            flex: 2,
                            child: Text('상태', textAlign: TextAlign.center),
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
      ),
    );
  }
}
