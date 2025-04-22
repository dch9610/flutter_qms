import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:qms_web/mainPage/main_screen.dart';
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
                title: 'Main',
                child: MainScreen(),
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
