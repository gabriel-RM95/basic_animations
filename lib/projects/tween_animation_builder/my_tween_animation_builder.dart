import 'dart:math';

import 'package:flutter/material.dart';

import '../my_app_bar.dart';
import 'logic/cubit/add_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTweenAnimationBuilder extends StatelessWidget {
  const MyTweenAnimationBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCubit(),
      child: Builder(builder: (context) {
        int counter = context.select((AddCubit element) => element.state);
        return Scaffold(
          appBar: const MyAppBar(title: 'TweenAnimationBuilder\nand Transform'),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<AddCubit>().addButtonPressed();
            },
            child: const Icon(Icons.plus_one),
          ),
          body: Center(
            child: TweenAnimationBuilder<double>(
                key: Key(counter.toString()),
                duration: const Duration(milliseconds: 1000),
                tween: Tween(begin: 0.0, end: 1.0),
                curve: Curves.bounceOut,
                builder: (context, value, child) {
                  return Stack(
                    children: [
                      if (counter != 0)
                        Opacity(
                          opacity: 1 - value,
                          child: Transform(
                            transform: Matrix4.identity()
                              ..translate((value) * -300)
                              ..rotateZ(-5 * pi * value)
                              ..scale(1 - value),
                            alignment: Alignment.center,
                            child: Text(
                              (counter - 1).toString(),
                              style: const TextStyle(fontSize: 60),
                            ),
                          ),
                        ),
                      Opacity(
                        opacity: value,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..translate((1 - value) * 200)
                            ..scale((1 - value) * 5 + 1, (1 - value) * 5 + 1),
                          alignment: Alignment.center,
                          child: Text(
                            context
                                .select((AddCubit element) => element.state)
                                .toString(),
                            style: const TextStyle(fontSize: 60),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        );
      }),
    );
  }
}
