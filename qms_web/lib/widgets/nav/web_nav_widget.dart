import 'package:flutter/material.dart';
import 'package:qms_web/util/asset_path.dart';
import 'package:qms_web/util/util_color.dart';
import 'package:qms_web/widgets/nav/web_nav_list.dart';

class WebNavWidget extends StatefulWidget {
  const WebNavWidget({super.key});

  @override
  State<WebNavWidget> createState() => _WebNavWidgetState();
}

class _WebNavWidgetState extends State<WebNavWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
      child: Container(
        width: 270,
        height: double.infinity,
        decoration: BoxDecoration(
          color: CustomColor.backgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(12),
            topLeft: Radius.circular(0),
            topRight: Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                child: Image.asset(
                  AssetPath.menuDKCMLogo,
                  width: 200,
                  height: 50,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(height: 10,),
              
              WebNavList(
                navName: "MAIN",
                icon: Icon(Icons.home_filled, color: Colors.blue, size: 28),
              ),

              WebNavList(
                navName: "FH COIL 작업실적",
                icon: Icon(Icons.factory_rounded, color: Colors.blue, size: 28),
              ),

              WebNavList(
                navName: "HOT COIL 작업실적",
                icon: Icon(Icons.factory_sharp, color: Colors.blue, size: 28),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
