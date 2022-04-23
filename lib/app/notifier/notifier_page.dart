import 'package:flutter/material.dart';
import 'package:riverprodemo/app/notifier/change_notifier_page.dart';
import 'package:riverprodemo/app/notifier/state_notifier_page.dart';

class NotifierPage extends StatelessWidget {
  const NotifierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifier"),
      ),
      body: Center(
        child: Wrap(
            children: [
              ElevatedButton(
                child: const Text("StateNotifierProvider"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangeNotifierPage()),
                  );
                },
              ),
              ElevatedButton(
                child: const Text("ChangeNotifierProvider"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StateNotifierPage()),
                  );
                },
              ),
            ],
            direction: Axis.vertical,
            spacing: 20, // to apply margin in the main axis of the wrap
            runSpacing: 20),
      ),
    );
  }
}
