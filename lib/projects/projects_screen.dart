import 'package:flutter/material.dart';

import 'animated_widget_practice/my_animated_widget.dart';
import 'built_in_explicit_animation/built_in_explicit_animation.dart';
import 'draggable_scrollable_sheet/draggable_scrollable_sheet_animation.dart';
import 'my_app_bar.dart';
import 'on_scroll_animation/on_scroll_animation_screen.dart';
import 'physics_simulation.dart/physics_simulation.dart';
import 'shiny_button_animation.dart/shiny_button_animation.dart';
import 'tween_animation_builder/my_tween_animation_builder.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MyAppBar(
          title: 'Animation Practices',
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OnScrollAnimation(),
                  ),
                ),
                child: const Text('On Scroll Animation'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShinyButtonAnimation(),
                  ),
                ),
                child: const Text('Shiny Button Animation'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const DraggableScrollableSheetAnimation(),
                  ),
                ),
                child: const Text('DraggableScrollableSheet'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyTweenAnimationBuilder(),
                  ),
                ),
                child: const Text(
                  'TweenAnimationBuilder\nand Transform',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BuiltInExplicitAnimation(),
                  ),
                ),
                child: const Text(
                  'Built-in explicit animation',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyAnimatedWidget(),
                  ),
                ),
                child: const Text(
                  'Animated Widget',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PhysicsSimulation(),
                  ),
                ),
                child: const Text(
                  'Animation using physics simulation',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
