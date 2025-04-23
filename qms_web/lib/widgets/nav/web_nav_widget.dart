import 'package:flutter/material.dart';
import 'package:qms_web/util/asset_path.dart';
import 'package:qms_web/util/util_color.dart';
import 'package:qms_web/util/util_menu.dart';
import 'package:qms_web/util/util_text.dart';
import 'package:qms_web/widgets/nav/web_nav_list.dart';

class WebNavWidget extends StatelessWidget {
  const WebNavWidget({super.key, required this.currentIndex});

  final int currentIndex;
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
              const SizedBox(height: 10),

              ...List.generate(UtilMenu.menuItems.length, (index) {
                final item = UtilMenu.menuItems[index];
                return WebNavList(
                  navName: item.title,
                  index: index,
                  textStyle:
                      currentIndex == index
                          ? UtilText.get24(
                            context,
                            CustomColor.primaryBtnTextColor,
                          ).copyWith(fontWeight: FontWeight.bold)
                          : UtilText.get15(
                            context,
                            CustomColor.primaryBtnTextColor,
                          ).copyWith(fontWeight: FontWeight.w400),
                  icon: Icon(
                    // UtilMenu.menuIcon[index],
                    item.icon,
                    color: CustomColor.grayStaticColor,
                    size: 28,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
