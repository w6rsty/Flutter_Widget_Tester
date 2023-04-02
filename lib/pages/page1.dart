import 'package:flutter/material.dart';
import 'package:test/pages/template.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DisplayPage(
        title: "圆形动画进度条",
        description: "使用动画控制器，播放一秒，结束后倒放一遍，实现红色到蓝色的补间动画",
        child: Center(child: ColorfulIndicator()),
    );
  }
}

class ColorfulIndicator extends StatefulWidget {
  const ColorfulIndicator({Key? key}) : super(key: key);

  @override
  State<ColorfulIndicator> createState() => _ColorfulIndicatorState();
}

class _ColorfulIndicatorState extends State<ColorfulIndicator>
    with SingleTickerProviderStateMixin{

  late AnimationController _controller;


  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1)
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: ColorTween(
        begin: Colors.red,
        end: Colors.blue,
      ).animate(_controller),
    );
  }
}