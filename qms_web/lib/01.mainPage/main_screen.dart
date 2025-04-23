import 'package:flutter/material.dart';
import 'package:qms_web/01.mainPage/widgets/widget_main_state.dart';
import 'package:qms_web/util/util_color.dart';
import 'package:qms_web/util/util_text.dart';
import 'package:qms_web/widgets/nav/web_nav_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("QMS")),
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
                            "Dash board",
                            style: UtilText.get20(
                              context,
                              UtilityColor.primaryTextColor,
                            ).copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Welcome to your company dashboard, review activity below.",
                            style: UtilText.get11(
                              context,
                              UtilityColor.primaryTextColor,
                            ).copyWith(fontWeight: FontWeight.bold),
                          ),

                          WidgetMainDatacard(),
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
  }
}
