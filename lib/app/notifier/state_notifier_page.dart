import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Car {
  final int speed;
  final int doors;

  const Car({this.speed = 120, this.doors = 4});

  Car copyWith({
    int? speed,
    int? doors,
  }) {
    return Car(
      speed: speed ?? this.speed,
      doors: doors ?? this.doors,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'speed': speed,
      'doors': doors,
    };
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      speed: map['speed']?.toInt() ?? 0,
      doors: map['doors']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Car.fromJson(String source) => Car.fromMap(json.decode(source));

  @override
  String toString() => 'Car(speed: $speed, doors: $doors)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Car && other.speed == speed && other.doors == doors;
  }

  @override
  int get hashCode => speed.hashCode ^ doors.hashCode;
}

class CarNotifier extends StateNotifier<Car> {
  CarNotifier() : super(const Car());

  void setDoors(int doors) {
    final newState = state.copyWith(doors: doors);
    state = newState;
  }

  void increaseSpeed() {
    final speed = state.speed + 5;
    final newState = state.copyWith(speed: speed);
    state = newState;
  }

  void hitBreak() {
    final speed = max(0, state.speed - 30);
    final newState = state.copyWith(speed: speed);
    state = newState;
  }
}

final carProvider = StateNotifierProvider.autoDispose<CarNotifier, Car>((ref) {
  return CarNotifier();
});

class StateNotifierPage extends ConsumerWidget {
  const StateNotifierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final car = ref.watch(carProvider.notifier);
    final speed = ref.watch(carProvider).speed;
    final door = ref.watch(carProvider).doors;
    return Scaffold(
      appBar: AppBar(
        title: const Text("StateNotifierPage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Speed ${speed}"),
            Text("Door ${door}"),
            ElevatedButton(
              child: const Text("Increase 5"),
              onPressed: () {
                ref.read(carProvider.notifier).increaseSpeed();
              },
            ),
            ElevatedButton(
              child: const Text("Random"),
              onPressed: () {
                ref.read(carProvider.notifier).hitBreak();
              },
            ),
            Slider(
                value: door.toDouble(),
                max: 5,
                onChanged: (value) {
                  car.setDoors(value.toInt());
                })
          ],
        ),
      ),
    );
  }
}
