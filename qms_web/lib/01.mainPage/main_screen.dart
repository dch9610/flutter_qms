import 'package:flutter/material.dart';
import 'package:qms_web/01.mainPage/widgets/widget_day_production_status.dart';
import 'package:qms_web/01.mainPage/widgets/widget_main_state.dart';
import 'package:qms_web/01.mainPage/widgets/widget_main_stop_information.dart';
import 'package:qms_web/01.mainPage/widgets/widget_month_production_status.dart';
import 'package:qms_web/util/util_color.dart';
import 'package:qms_web/util/util_text.dart';
import 'package:qms_web/widgets/nav/web_nav_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // double screendWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constrains) {
        if (constrains.minWidth < 1200) {
          return Scaffold(
            body: Center(
              child: Text(
                "일정 크기 이하로 줄어들면 표시되지 않습니다!",
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
          );
        }
        return Scaffold(
          backgroundColor: Colors.white,
          // appBar: AppBar(title: Text("QMS")),
          body: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WebNavWidget(currentIndex: 0),

              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0, -1),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    constraints: BoxConstraints(maxWidth: 1500),
                    decoration: BoxDecoration(
                      color: UtilityColor.primaryBackgroundColor,
                    ),
                    alignment: AlignmentDirectional(0, 0),
                    child: Align(
                      alignment: AlignmentDirectional(0, -1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(height: 32),
                              Text(
                                "QMS",
                                style: UtilText.get32(
                                  context,
                                  UtilityColor.primaryTextColor,
                                ).copyWith(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Quality Management System",
                                style: UtilText.get11(
                                  context,
                                  UtilityColor.primaryTextColor,
                                ).copyWith(fontWeight: FontWeight.bold),
                              ),

                              const SizedBox(height: 20),
                              Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(child: WidgetMainDatacard()),
                                      WidgetDayProductionStatus(),
                                      WidgetMonthProductionStatus(),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),

                              const SizedBox(height: 30),

                              Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [WidgetMainStopInformation()],
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                              // const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
