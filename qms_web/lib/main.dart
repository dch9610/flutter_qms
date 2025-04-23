import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:qms_web/01.mainPage/main_screen.dart';
import 'package:qms_web/02.fullhardPage/fullhard_screen.dart';
import 'package:qms_web/03.hotcoilPage/hotcoil_screen.dart';
import 'package:qms_web/04.productPage/product_screen.dart';
import 'package:qms_web/05.analysisPage/analysis_screen.dart';
import 'package:qms_web/06.requestPage/request_screen.dart';
import 'package:qms_web/route_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final routerDelegate = BeamerDelegate(
    // 화면 이동
    transitionDelegate: const NoAnimationTransitionDelegate(),
    beamBackTransitionDelegate: const NoAnimationTransitionDelegate(),

    initialPath: RoutePage.main,
    notFoundRedirectNamed: RoutePage.main,

    locationBuilder:
        RoutesLocationBuilder(
          routes: {
            RoutePage.main: (context, state, data) {
              return const BeamPage(
                key: ValueKey("main"),
                title: 'MAIN',
                child: MainScreen(),
              );
            },

            RoutePage.fullhardcoilperformance: (context, state, data) {
              return const BeamPage(
                key: ValueKey("fullhardcoilperformance"),
                title: 'FH COIL',
                child: FullhardScreen(),
              );
            },

            RoutePage.hotcoilperformance: (context, state, data) {
              return const BeamPage(
                key: ValueKey("hotcoilperformance"),
                title: 'HOT COIL',
                child: HotcoilScreen(),
              );
            },

            RoutePage.productperformance: (context, state, data) {
              return const BeamPage(
                key: ValueKey("productperformance"),
                title: 'PRODUCT',
                child: ProductScreen(),
              );
            },

            RoutePage.analysis: (context, state, data) {
              return const BeamPage(
                key: ValueKey("analysis"),
                title: 'ANALYSIS',
                child: AnalysisScreen(),
              );
            },

            RoutePage.requestboard: (context, state, data) {
              return const BeamPage(
                key: ValueKey("requestboard"),
                title: 'REQUEST BOARD',
                child: RequestScreen(),
              );
            },
          },
        ).call,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'QMS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: routerDelegate,
      ),
    );
  }
}
