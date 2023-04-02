import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test/pages/template.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  final StreamController<String> _controller = StreamController<String>();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DisplayPage(
        title: "StreamBuilder",
        description: null,
        others: [
          Wrap(
            spacing: 20,
            children: [
              TextField(
                controller: _textEditingController,
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.add(_textEditingController.text);
                },
                child: const Text("提交"),
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.addError("error");
                },
                child: const Text("错误"),
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.close();
                },
                child: const Text("close"),
              ),
            ],
          ),
        ],
        child: Center(
          child: StreamBuilder(
            stream: _controller.stream
                .map((item) => item).distinct(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              print("正在重新构建StreamBuilder");
              if (snapshot.connectionState == ConnectionState.done) {
                return const ListTile(title: Text("数据流已关闭"));
              }
              if (snapshot.hasData) return ListTile(title: Text("${snapshot.data}"));
              if (snapshot.hasError) return ListTile(title: Text("${snapshot.error}"));
              return const CircularProgressIndicator();
            },
          ),
        ),
    );
  }
}

class NewsEntity {
  final String news;
  NewsEntity({required this.news});
}
