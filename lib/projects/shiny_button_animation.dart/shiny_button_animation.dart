import 'package:flutter/material.dart';

import '../my_app_bar.dart';

class ShinyButtonAnimation extends StatelessWidget {
  const ShinyButtonAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        title: 'Shiny Button',
      ),
      body: TheButton(),
    );
  }
}

class TheButton extends StatefulWidget {
  const TheButton({Key? key}) : super(key: key);

  @override
  TheButtonState createState() => TheButtonState();
}

class TheButtonState extends State<TheButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500))
      ..repeat(reverse: true);
    /*  _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward(from: 0.0);
      }
    });
    _controller.forward(); */
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        onPressed: () {
          print('Button Pressed');
        },
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).buttonColor,
                    Colors.white,
                    Theme.of(context).buttonColor
                  ],
                  stops: [0.0, _controller.value, 1.0],
                )),
            child: const Text(
              'Shiny Button Here!',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
