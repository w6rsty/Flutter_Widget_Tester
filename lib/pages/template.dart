import 'package:flutter/material.dart';

class DisplayPage extends StatefulWidget {
  final String title;
  final String? description;
  final List<Widget>? others;
  final Widget child;
  const DisplayPage({
    Key? key,
    required this.title,
    required this.description,
    required this.child, 
    this.others,
  }) : super(key: key);

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(flex: 2,child: widget.child),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding: const EdgeInsets.all(15.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: SingleChildScrollView(
                    child: Text(widget.description ?? widget.title)
                ),
              ),
            ),
          ),
          Visibility(
            visible: widget.others != null,
            child: Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: widget.others ?? [const SizedBox()],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
