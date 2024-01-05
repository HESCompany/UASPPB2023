import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  ValueNotifier counted = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: flutterNesTheme(),
      home: Scaffold(
          body: ListView(
        children: [
          ValueListenableBuilder(
            valueListenable: counted,
            builder: (context, value, widget) {
              int tres = counted.value;
              if (tres >= 5) {
                return Center(child: Text("$tres"));
              } else {
                return Center(child: Text("Too low"));
              }
            },
          ),
          ListTile(
            onTap: () {
              counted.value += 1;
            },
            leading: Text("Press"),
          )
        ],
      )),
    );
  }
}
