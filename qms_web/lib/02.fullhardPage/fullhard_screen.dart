import 'package:flutter/material.dart';
import 'package:qms_web/02.fullhardPage/widgets/widget_fhcoil_list.dart';
import 'package:qms_web/02.fullhardPage/widgets/widget_search_coil.dart';
import 'package:qms_web/util/util_color.dart';
import 'package:qms_web/util/util_text.dart';
import 'package:qms_web/widgets/nav/web_nav_widget.dart';

class FullhardScreen extends StatelessWidget {
  const FullhardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var minWidth = 1200;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.minWidth < minWidth) {
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
          body: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WebNavWidget(currentIndex: 1),

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
                                "FH COIL LIST",
                                style: UtilText.get32(
                                  context,
                                  UtilityColor.primaryTextColor,
                                ).copyWith(fontWeight: FontWeight.bold),
                              ),

                              SizedBox(height: 30),

                              Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [WidgetSearchCoil()],
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [WidgetFhcoilList()],
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
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
