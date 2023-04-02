import 'package:flutter/material.dart';
import 'package:test/pages/page1.dart';
import 'package:test/pages/page2.dart';
import 'package:test/pages/page3.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: PageView(
        children: [
          const Page1(),
          Page2(),
          Page3(),
        ],
      ),
    );
  }
}




