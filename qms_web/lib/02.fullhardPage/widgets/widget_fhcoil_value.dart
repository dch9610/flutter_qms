import 'package:flutter/material.dart';
import 'package:qms_web/util/util_color.dart';

class WidgetFhcoilValue extends StatelessWidget {
  const WidgetFhcoilValue({super.key, this.cFHCoilNo, this.cL3FHCoilNo});

  final cL3FHCoilNo;
  final cFHCoilNo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
      child: Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
          color: UtilityColor.secondaryBackgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 0,
              color: UtilityColor.primaryBackgroundColor,
              offset: Offset(0, 1),
            ),
          ],
        ),

        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 4,
                child: Text(cL3FHCoilNo, textAlign: TextAlign.center),
              ),
              VerticalDivider(),
              Expanded(
                flex: 4,
                child: Text(cFHCoilNo, textAlign: TextAlign.center),
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
              Expanded(flex: 3, child: Text('길이', textAlign: TextAlign.center)),
              VerticalDivider(),
              Expanded(
                flex: 3,
                child: Text('출측 중량', textAlign: TextAlign.center),
              ),
              VerticalDivider(),
              Expanded(flex: 2, child: Text('상태', textAlign: TextAlign.center)),
            ],
          ),
        ),
      ),
    );
  }
}
