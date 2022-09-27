import 'package:flutter/material.dart';
import 'package:freelance_demo/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: getRoute,
      themeMode: ThemeMode.system,
      home: addAuth(context, Container()),
    );
  }
}
