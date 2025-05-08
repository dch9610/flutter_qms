import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qms_web/util/util_color.dart';

class WidgetFhcoilValue extends StatefulWidget {
  const WidgetFhcoilValue({
    super.key,
    required this.cFHCoilNo,
    required this.cL3FHCoilNo,
    required this.cEndTime,
    required this.iProcTime,
    required this.cSteelGrade,
    required this.cNextProc,
    required this.iHotWidth00,
    required this.iHotThick00,
    required this.iActWidth,
    required this.iActThk,
    required this.iClaLength,
    required this.iActWeight,
    required this.cCoilStatus,
  });

  final String cL3FHCoilNo;
  final String cFHCoilNo;
  final String cEndTime;
  final String iProcTime;
  final String cSteelGrade;
  final String cNextProc;
  final String iHotWidth00;
  final String iHotThick00;
  final String iActWidth;
  final String iActThk;
  final String iClaLength;
  final String iActWeight;
  final String cCoilStatus;

  @override
  State<WidgetFhcoilValue> createState() => _WidgetFhcoilValueState();
}

class _WidgetFhcoilValueState extends State<WidgetFhcoilValue> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#,##0");
    final dotformatter = NumberFormat("#,##0.000");
    return GestureDetector(
      onTap: () => setState(() => isSelected = !isSelected),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
        child: Container(
          width: 100,
          height: 30,
          decoration: BoxDecoration(
            color: isSelected ? Colors.amber :UtilityColor.secondaryBackgroundColor,
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
                  child: Text(widget.cL3FHCoilNo, textAlign: TextAlign.center),
                ),
                VerticalDivider(),
                Expanded(
                  flex: 4,
                  child: Text(widget.cFHCoilNo, textAlign: TextAlign.center),
                ),
                VerticalDivider(),
                Expanded(
                  flex: 6,
                  child: Text(
                    "${widget.cEndTime.substring(0, 4)}-${widget.cEndTime.substring(4, 6)}-${widget.cEndTime.substring(6, 8)} ${widget.cEndTime.substring(8, 10)}:${widget.cEndTime.substring(10, 12)}:${widget.cEndTime.substring(12, 14)}",
                    textAlign: TextAlign.center,
                  ),
                ),
                VerticalDivider(),
                Expanded(
                  flex: 3,
                  child: Text(widget.iProcTime.toString(), textAlign: TextAlign.center),
                ),
                VerticalDivider(),
                Expanded(
                  flex: 2,
                  child: Text(widget.cSteelGrade, textAlign: TextAlign.center),
                ),
                VerticalDivider(),
                Expanded(
                  flex: 3,
                  child: Text(widget.cNextProc, textAlign: TextAlign.center),
                ),
                VerticalDivider(),
                Expanded(
                  flex: 3,
                  child: Text(
                    formatter.format(int.tryParse(widget.iHotWidth00)),
                    textAlign: TextAlign.center,
                  ),
                ),
                VerticalDivider(),
                Expanded(
                  flex: 3,
                  child: Text(
                    dotformatter.format(
                      (double.tryParse(widget.iHotThick00.toString()) ?? 0.0) / 1000,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                VerticalDivider(),
                Expanded(
                  flex: 3,
                  child: Text(
                    formatter.format(int.tryParse(widget.iActWidth)),
                    textAlign: TextAlign.center,
                  ),
                ),
                VerticalDivider(),
                Expanded(
                  flex: 3,
                  child: Text(
                    dotformatter.format(
                      (double.tryParse(widget.iActThk.toString()) ?? 0.0) / 1000,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                VerticalDivider(),
                Expanded(
                  flex: 3,
                  child: Text(
                    formatter.format(int.tryParse(widget.iClaLength)),
                    textAlign: TextAlign.center,
                  ),
                ),
                VerticalDivider(),
                Expanded(
                  flex: 3,
                  child: Text(
                    dotformatter.format(
                      (double.tryParse(widget.iActWeight.toString()) ?? 0.0) / 1000,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                VerticalDivider(),
                Expanded(
                  flex: 2,
                  child: Text(widget.cCoilStatus, textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
