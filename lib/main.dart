import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foreca/constants.dart';
import 'package:foreca/controllers/candles_controller.dart';
import 'package:foreca/controllers/price_controller.dart';
import 'package:foreca/controllers/theme_handler.dart';
import 'package:foreca/landing/initial_page.dart';
import 'package:foreca/landing/on_web_land.dart';
import 'package:foreca/landing/second_page.dart';
import 'package:foreca/landing/third_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeHandler(),
        ),
        ChangeNotifierProvider(
          create: (context) => PriceNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => CandlesNotifier(),
        ),
      ],
      child: Consumer<ThemeHandler>(
          builder: (context, ThemeHandler handler, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1,
              ), //set desired text scale factor here
              child: child!,
            );
          },
          title: 'Flutter Demo',
          theme: handler.darkTheme! ? kLightTheme : kDarkTheme,
          home: MyHomePage(title: 'ForeCa'),
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: kIsWeb
            ? SizedBox(width: size.width, child: OnWebLandingPage())
            : PageView(
                children: [
                  InitialPage(),
                  SecondPage(),
                  ThirdPage(),
                ],
              ));
  }
}
