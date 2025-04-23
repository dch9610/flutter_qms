import 'package:flutter/material.dart';
import 'package:qms_web/widgets/nav/web_nav_widget.dart';

class FullhardScreen extends StatelessWidget {
  const FullhardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QMS"),
      ),
      body: Row(
        children: [WebNavWidget(currentIndex: 1,)],
      ),
    );
  }
}