
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:try1/indexpage.dart';

void main() {
  runApp( MaterialApp(
    theme: ThemeData(primarySwatch: Colors.red),
    debugShowCheckedModeBanner: false ,
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IndexPage(),
    );
  }
}







