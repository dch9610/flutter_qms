import 'package:flutter/material.dart';
import 'package:qms_web/widgets/nav/web_nav_widget.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QMS"),
      ),
      body: Row(
        children: [WebNavWidget(currentIndex: 5,)],
      ),
    );
  }
}