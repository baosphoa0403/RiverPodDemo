import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final cityProvider = Provider<String>((ref) {
  return "Munich";
});

Future<int> fetchWeather(String city) async {
  await Future.delayed(const Duration(seconds: 2));
  return city == "Munich" ? 20 : 15;
}

final futureProvider = FutureProvider<int>((ref) {
  final city = ref.watch(cityProvider);
  return fetchWeather(city);
});

class CombineProviderPage extends ConsumerWidget {
  const CombineProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<int> future = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("CombineProviderPage"),
      ),
      body: Center(
        child: future.when(
          data: (value) => Text(value.toString()),
          loading: () => CircularProgressIndicator(),
          error: (e, stack) => Text('Error: $e'),
        ),
      ),
    );
  }
}
