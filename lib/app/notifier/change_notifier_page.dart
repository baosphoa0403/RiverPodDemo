import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarNotifier extends ChangeNotifier {
  int _speed = 120;

  void increase() {
    _speed += 5;
    notifyListeners();
  }

  void hitBreak() {
    _speed = max(0, _speed - 30);
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("dispse run");
  }
}

final carProvider = ChangeNotifierProvider.autoDispose<CarNotifier>((ref) {
  return CarNotifier();
});

class ChangeNotifierPage extends ConsumerWidget {
  const ChangeNotifierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speed = ref.watch(carProvider)._speed;
    return Scaffold(
      appBar: AppBar(
        title: Text("ChangeNotifierPage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Speed ${speed}"),
            ElevatedButton(
              child: const Text("Increase 5"),
              onPressed: () {
                ref.read(carProvider.notifier).increase();
              },
            ),
            ElevatedButton(
              child: const Text("Random"),
              onPressed: () {
                ref.read(carProvider.notifier).hitBreak();
              },
            )
          ],
        ),
      ),
    );
  }
}
