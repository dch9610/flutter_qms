import 'package:flutter/material.dart';
import 'package:qms_web/util/util_color.dart';

class WidgetSearchCoil extends StatelessWidget {
  const WidgetSearchCoil({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
        child: Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: CustomColor.primary600Color),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [Text("Hi")]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
