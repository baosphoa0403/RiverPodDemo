import 'package:flutter/material.dart';

class NotifierPage extends StatelessWidget {
  const NotifierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifier"),
      ),
      body: const Center(
        child: Text("Notifier"),
      ),
    );
  }
}
