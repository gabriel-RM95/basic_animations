import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../my_app_bar.dart';

class OnScrollAnimation extends StatefulWidget {
  const OnScrollAnimation({Key? key}) : super(key: key);

  @override
  OnScrollAnimationState createState() => OnScrollAnimationState();
}

class OnScrollAnimationState extends State<OnScrollAnimation> {
  ScrollController scrollController = ScrollController();
  bool expanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'On Scroll Animation',
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (_) {
          if (scrollController.position.userScrollDirection ==
                  ScrollDirection.reverse &&
              expanded) {
            setState(() {
              expanded = false;
            });
          } else if (scrollController.position.userScrollDirection ==
                  ScrollDirection.forward &&
              !expanded) {
            setState(() {
              expanded = true;
            });
          }
          return true;
        },
        child: SafeArea(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            itemCount: 25,
            itemBuilder: (context, index) => ListItem(
              color: Colors.primaries[index % Colors.primaries.length],
            ),
          ),
        ),
      ),
      floatingActionButton: AnimatedFAB(
        expanded: expanded,
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final Color color;

  const ListItem({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: CircleAvatar(
        backgroundColor: color,
        child: const Icon(
          Icons.person,
          color: Colors.black,
        ),
      ),
      title: const Text('Title'),
      subtitle: const Text('Subtitle here'),
    );
  }
}

class AnimatedFAB extends StatelessWidget {
  const AnimatedFAB({Key? key, this.expanded = false}) : super(key: key);

  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 50,
      width: expanded ? 130 : 50,
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: Colors.blue[800],
        borderRadius: BorderRadius.circular(25),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            child: Stack(
              children: const [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.message)),
                Positioned(left: 30, top: 14, child: Text('Start chat')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
