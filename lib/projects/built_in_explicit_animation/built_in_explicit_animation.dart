import 'package:flutter/material.dart';

import '../my_app_bar.dart';

class BuiltInExplicitAnimation extends StatefulWidget {
  const BuiltInExplicitAnimation({Key? key}) : super(key: key);

  @override
  BuiltInExplicitAnimationState createState() =>
      BuiltInExplicitAnimationState();
}

class BuiltInExplicitAnimationState extends State<BuiltInExplicitAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controllerContainer;

  late Animation<double> _animationContainer;

  @override
  void initState() {
    super.initState();

    _controllerContainer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    _animationContainer = CurvedAnimation(
        parent: _controllerContainer, curve: Curves.elasticInOut);
  }

  @override
  void dispose() {
    _controllerContainer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Built-in explicit animation'),
      body: Center(
        child: RotationTransition(
          turns: _animationContainer,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey,
            ),
            child: ScaleTransition(
              scale: _animationContainer,
              child: const Icon(
                Icons.person_outline,
                size: 100,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controllerContainer.forward(from: 0.0);
        },
        child: const Icon(Icons.replay_rounded),
      ),
    );
  }
}
