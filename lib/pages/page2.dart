import 'package:flutter/material.dart';
import 'package:test/pages/template.dart';

class Page2 extends StatefulWidget {
  Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  Future<String?>? getDataFunc() async {
    await Future.delayed(const Duration(seconds: 5));
    return "Hello, World";
  }

  int state = 0;

  @override
  Widget build(BuildContext context) {
    return DisplayPage(
      title: "FutureBuilder", 
      description: "模拟网络请求，5秒后显示字符串",
      child: FutureBuilder(
        future: getDataFunc(),
        initialData: "Loading...",
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.hasData) {
            return Center(child: Text(snapshot.data!));
          } else if(snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
