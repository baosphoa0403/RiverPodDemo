import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<int> fetchWeather() async {
  await Future.delayed(const Duration(seconds: 2));
  return 20;
}

final futureProvider = FutureProvider.autoDispose<int>((ref) {
  return fetchWeather();
});

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<int> future = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("FutureProviderPage"),
      ),
      body: Center(
        child: future.when(
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
          data: (data) {
            return Text(data.toString());
          },
        ),
      ),
    );
  }
}
