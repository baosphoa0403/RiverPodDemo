import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider =
    StreamProvider.autoDispose<String>((ref) => Stream.periodic(
          Duration(milliseconds: 400),
          (count) => '$count',
        ));

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<String> stream = ref.watch(streamProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("StreamProviderPage"),
        ),
        body: Center(
            child: stream.when(data: (data) {
          return Text(data);
        }, error: (error, stack) {
          return Text("Error ${error}");
        }, loading: () {
          return CircularProgressIndicator();
        })
            //     StreamBuilder<String>(
            //   stream: ref.watch(streamProvider.stream),
            //   builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            //     log(snapshot.connectionState.toString());
            //     switch (snapshot.connectionState) {
            //       case ConnectionState.waiting:
            //         return CircularProgressIndicator();
            //       default:
            //         if (snapshot.hasError) {
            //           return Text("Error ${snapshot.error}");
            //         } else {
            //           final counter = snapshot.data;
            //           return Text(counter!);
            //         }
            //     }
            //   },
            // )),
            ));
  }
}
