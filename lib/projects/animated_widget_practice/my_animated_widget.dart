import 'dart:math';

import 'package:flutter/material.dart';

import '../my_app_bar.dart';

class MyAnimatedWidget extends StatefulWidget {
  const MyAnimatedWidget({Key? key}) : super(key: key);

  @override
  MyAnimatedWidgetState createState() => MyAnimatedWidgetState();
}

class MyAnimatedWidgetState extends State<MyAnimatedWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  var forward = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Animated Widget'),
      body: Center(
        child: ValueListenableBuilder(
            valueListenable: forward,
            builder: (context, value, widget) {
              return RotationAnimation(forward: value, animation: _controller);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_controller.status == AnimationStatus.forward) {
            await _controller.animateTo(0.0);
          } else if (_controller.status == AnimationStatus.reverse) {
            await _controller.animateTo(1.0);
          }
          forward.value = !forward.value;
          _controller.repeat();
        },
        child: const Icon(Icons.compare_arrows),
      ),
    );
  }
}

class RotationAnimation extends AnimatedWidget {
  const RotationAnimation(
      {required this.forward, super.key, required Animation<double> animation})
      : super(listenable: animation);

  final bool forward;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.002)
        ..rotateY(
            forward ? animation.value * pi * 2 : -animation.value * pi * 2),
      alignment: Alignment.center,
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
          boxShadow: const [
            BoxShadow(
                offset: Offset(0.0, 3.0),
                spreadRadius: 7,
                blurRadius: 5,
                color: Colors.black26),
          ],
        ),
      ),
    );
  }
}
