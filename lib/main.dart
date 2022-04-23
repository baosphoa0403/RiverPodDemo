import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverprodemo/app/modifier/family_primitive_modifier.dart';
import 'package:riverprodemo/app/notifier/notifier_page.dart';
import 'package:riverprodemo/app/provider/provider_page.dart';

final helloWorldProvider = Provider((_) => 'Hello world dsads');
final helloProvider = Provider<String>((ref) {
  return "hello my friends :V what up man";
});
void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  Widget getBody() {
    if (this._selectedIndex == 0) {
      return const ProviderPage();
    } else if (this._selectedIndex == 1) {
      return const NotifierPage();
    } else {
      return FamilyPrimitiveModifierPage();
    }
  }

  static const List<Widget> _widgetOptions = <Widget>[
    ProviderPage(),
    NotifierPage(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // "ref" can be used in all life-cycles of a StatefulWidget.
    ref.read(helloWorldProvider);
  }

  @override
  Widget build(BuildContext context) {
    final String value = ref.watch(helloProvider);

    return MaterialApp(
      home: Scaffold(
        body: getBody(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Text("River Provider"),
              icon: Icon(Icons.home),
              label: 'Provider',
            ),
            BottomNavigationBarItem(
              activeIcon: Text("River Provider"),
              icon: Icon(Icons.business),
              label: 'Notifier',
            ),
            BottomNavigationBarItem(
              activeIcon: Text("River Provider"),
              icon: Icon(Icons.school),
              label: 'Modifier',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
