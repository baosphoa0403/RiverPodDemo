import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverprodemo/app/provider/combine_provider_page.dart';
import 'package:riverprodemo/app/provider/future_provider_page.dart';
import 'package:riverprodemo/app/provider/state_provider_page.dart';
import 'package:riverprodemo/app/provider/stream_provider_page.dart';

class ProviderPage extends ConsumerWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Provider"),
        ),
        body: Center(
            child: Wrap(
                direction: Axis.vertical,
                spacing: 20, // to apply margin in the main axis of the wrap
                runSpacing: 20, // to apply margin in the cross axis of the wrap
                children: <Widget>[
              ElevatedButton(
                child: Text("State Provider"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StateProviderPage()),
                  );
                },
              ),
              ElevatedButton(
                child: Text("Future Provider"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FutureProviderPage()),
                  );
                },
              ),
              ElevatedButton(
                child: Text("StreamProviderPage"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StreamProviderPage()),
                  );
                },
              ),
              ElevatedButton(
                child: Text("CombineProviderPage"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CombineProviderPage()),
                  );
                },
              ),
            ])));
  }
}
