import 'package:flutter/material.dart';

class DraggableScrollableSheetAnimation extends StatefulWidget {
  const DraggableScrollableSheetAnimation({Key? key}) : super(key: key);

  @override
  DraggableScrollableSheetAnimationState createState() =>
      DraggableScrollableSheetAnimationState();
}

class DraggableScrollableSheetAnimationState
    extends State<DraggableScrollableSheetAnimation> {
  double visibility = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              bottom: MediaQuery.of(context).size.height * 0.3,
              child: Image.asset(
                'assets/images/1366_2000.jpg',
                fit: BoxFit.cover,
              ),
            ),
            NotificationListener<DraggableScrollableNotification>(
              onNotification: (notification) {
                setState(() {
                  visibility = (notification.extent / 0.43 - 1) * 2.5;
                });
                return true;
              },
              child: DraggableScrollableSheet(
                initialChildSize: 0.43,
                maxChildSize: 0.86,
                minChildSize: 0.43,
                builder: (context, scrollController) {
                  return Material(
                    elevation: 10,
                    color: Theme.of(context).bottomAppBarTheme.color,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        controller: scrollController,
                        child: Stack(
                          children: [
                            AnimatedOpacity(
                              duration: const Duration(),
                              opacity: (1 - visibility).clamp(0.0, 1.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      margin: const EdgeInsets.all(10),
                                      width: 50,
                                      height: 5,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  Text(
                                    'It\'s good to see you',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  Text(
                                    'Where are you going?',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const TextField(
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.search),
                                        hintText: 'Search destination'),
                                  ),
                                  _listTiles,
                                ],
                              ),
                            ),
                            Visibility(
                              visible: visibility > 1.5,
                              child: AnimatedOpacity(
                                duration: const Duration(),
                                opacity:
                                    visibility - visibility.clamp(0.0, 1.5),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 100.0),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        onTap: () {},
                                        leading: const Icon(Icons.home),
                                        title:
                                            const Text('Enter home location'),
                                      ),
                                      ListTile(
                                        onTap: () {},
                                        leading: const Icon(Icons.work),
                                        title:
                                            const Text('Enter work location'),
                                      ),
                                      _listTiles
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                top: -190 * (1 - (visibility / 2.5)),
                child: const TopAnimatedWidget()),
            Positioned(
              left: 0,
              right: 0,
              bottom: -50 * (1 - (visibility / 2.5)),
              child: const BottomAnimatedWidget(),
            ),
          ],
        ),
      ),
    );
  }

  final Widget _listTiles = Column(
    children: [
      ListTile(
        leading: const Icon(Icons.place),
        title: const Text('First Place'),
        subtitle: const Text('This is the first place'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.place),
        title: const Text('Second Place'),
        subtitle: const Text('This is the second place'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.place),
        title: const Text('Third place'),
        subtitle: const Text('This is the third place'),
        onTap: () {},
      ),
    ],
  );
}

class TopAnimatedWidget extends StatelessWidget {
  const TopAnimatedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Column(
        children: [
          Row(
            children: const [
              BackButton(),
              Text('Choose destination'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: const [
                TextField(
                  decoration: InputDecoration(hintText: 'Avenue 24'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Where are we going?'),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BottomAnimatedWidget extends StatelessWidget {
  const BottomAnimatedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.place_sharp),
            SizedBox(
              width: 5,
            ),
            Text('Pick in map')
          ],
        ),
      ),
    );
  }
}
