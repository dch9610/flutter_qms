import 'package:flutter/material.dart';
import 'package:qms_web/widgets/nav/web_nav_widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QMS"),
      ),
      body: Row(
        children: [WebNavWidget(currentIndex: 3,)],
      ),
    );
  }
}