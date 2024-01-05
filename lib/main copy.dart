import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:indexed/indexed.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  ValueNotifier counted = ValueNotifier(0);

  getdata() async {
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: flutterNesTheme(),
        home: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            return Mainpage();
          },
        ) //Authgate(),
        );
  }
}

//metal slug
//gta advance
//terraria
//ragnarok
//rusted warfare unofficial
//smbx
class Mainpage extends StatefulWidget {
  const Mainpage({super.key});
  @override
  State<Mainpage> createState() => Mainpage0();
}

class Mainpage0 extends State<Mainpage> {
  int selectedIndex = 0;
  int selectedIndex1 = 0;
  @override
  Widget build(BuildContext context) {
    Widget listitem = Padding(
      padding: const EdgeInsets.all(1),
      child: ListTile(
        
        contentPadding: EdgeInsets.all(0),
        title: Column(children: [
          ListTile(
            tileColor: Colors.lime,
            title: Text("data"),
          ),
          ListTile(
            tileColor: Colors.lime,
            title: Text("data"),
          )
        ]),
        tileColor: Colors.blue,
      ),
    );

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          title: Text('TodoBorne'),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          actions: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: ListTile(
                  tileColor: Colors.green,
                  title: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuAnchor(
                        builder: (context, controller, child) {
                          return IconButton(
                              onPressed: () {
                                if (controller.isOpen) {
                                  controller.close();
                                } else {
                                  controller.open();
                                }
                              },
                              icon: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.black,
                                child: Icon(
                                  Icons.person,
                                  size: 10,
                                  color: Colors.white,
                                ),
                              ));
                        },
                        menuChildren: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Column(children: [
                              MenuItemButton(
                                child: Text('Register'),
                                onPressed: () {},
                              ),
                              MenuItemButton(
                                child: Text('Logout'),
                                onPressed: () {},
                              ),
                            ]),
                          )
                        ],
                      ),
                      Text("\$5000", style: TextStyle(color: Colors.white)),
                    ],
                  )),
            )
          ],
        ),
        body: ListView(padding: EdgeInsets.all(1), children: [
          listitem,
          listitem,
          listitem,
          listitem,
          listitem,
          listitem,
          SizedBox(
            height: 80,
          ),
        ]),
        floatingActionButton: Column(
          verticalDirection:VerticalDirection.up,
          children: [
          Focus(
            autofocus: true,
            child: NavigationBarTheme(
              data: NavigationBarThemeData(
                iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
                  (Set<MaterialState> states) =>
                      states.contains(MaterialState.selected)
                          ? const IconThemeData(color: Colors.blueAccent)
                          : const IconThemeData(color: Colors.white),
                ),
                labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
                  (Set<MaterialState> states) =>
                      const TextStyle(color: Colors.white),
                ),
              ),
              child: NavigationBar(
                indicatorShape: BeveledRectangleBorder(),
                backgroundColor: Colors.blueAccent,
                indicatorColor: Colors.white,
                selectedIndex: selectedIndex,
                onDestinationSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                destinations: [
                  NavigationDestination(
                    tooltip: '',
                    icon: Icon(Icons.assignment),
                    label: 'Todo',
                    selectedIcon: Icon(Icons.edit_square),
                  ),
                  NavigationDestination(
                    tooltip: '',
                    icon: Icon(Icons.storefront_rounded),
                    label: 'Shop',
                    selectedIcon: Icon(Icons.shopping_bag_rounded),
                  ),
                  NavigationDestination(
                    tooltip: '',
                    icon: Icon(Icons.pets),
                    label: 'Koleksi',
                    selectedIcon: Icon(Icons.yard),
                  ),
                  NavigationDestination(
                    tooltip: '',
                    icon: Icon(Icons.account_circle_rounded),
                    label: 'Saya',
                    selectedIcon: Icon(Icons.account_box),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [Padding(
              padding: const EdgeInsets.all(10),
              child: NesButton(
                type: NesButtonType.primary,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(Icons.add),
                  ],
                ),
              ),
            )],
          )
          ],
        ));
  }
}

class _ClearButton extends StatelessWidget {
  const _ClearButton({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => controller.clear(),
      );
}

class Authage extends StatefulWidget {
  const Authage({super.key});
  @override
  State<Authage> createState() => Authage0();
}

class Authage0 extends State<Authage> {
  String status = 'L';
  bool value0 = false;
  bool value1 = true;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>((states) {
    if (states.contains(MaterialState.selected)) {
      return const Icon(Icons.check);
    }
    return const Icon(Icons.close);
  });

  @override
  Widget build(BuildContext context) {
    Widget s0con;
    Widget s1con;
    Widget section;
    switch (status) {
      case 'L':
        s0con = Icon(Icons.send);
        s1con = Icon(Icons.person_add);
        section = Lgnsec();
        break;
      case 'R':
        s0con = Icon(Icons.login);
        s1con = Icon(Icons.send);
        section = Regsec();
        break;
      default:
        throw UnimplementedError('no widget for $status');
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: SegmentedButton<String>(
          showSelectedIcon: false,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.cyan;
              }
              return Colors.white;
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.white;
              }
              return Colors.black;
            }),
          ),
          segments: <ButtonSegment<String>>[
            ButtonSegment<String>(
              icon: s0con,
              value: 'L',
              label: Text('Login'),
            ),
            ButtonSegment<String>(
              icon: s1con,
              value: 'R',
              label: Text('Register'),
            ),
          ],
          selected: <String>{status},
          onSelectionChanged: (option) {
            setState(() {
              status = option.first;
            });
          },
        ),
        centerTitle: true,
      ),
      //
      //
      //Separated
      //
      //
      body: Container(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image(image: AssetImage('images/Blankico.gif')),
            ListTile(
              title: Center(
                  child: Text("TodoBorne", style: TextStyle(fontSize: 20))),
            ),
            SizedBox(
              height: 20,
            ),
            section,
          ]),
        ),
      ),
    );
  }
}

class Todoform extends StatefulWidget {
  const Todoform({super.key});
  @override
  State<Todoform> createState() => Todoform0();
}

class Todoform0 extends State<Todoform> {
  String status = 'L';
  bool value0 = false;
  bool value1 = true;
  final TextEditingController _controllerOutlined = TextEditingController();
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>((states) {
    if (states.contains(MaterialState.selected)) {
      return const Icon(Icons.check);
    }
    return const Icon(Icons.close);
  });

  @override
  Widget build(BuildContext context) {
    Widget s0con;
    Widget s1con;
    Widget section;
    switch (status) {
      case 'L':
        s0con = Icon(Icons.send);
        s1con = Icon(Icons.person_add);
        section = Lgnsec();
        break;
      case 'R':
        s0con = Icon(Icons.login);
        s1con = Icon(Icons.send);
        section = Regsec();
        break;
      default:
        throw UnimplementedError('no widget for $status');
    }
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(20,0,20,20),
        child: NesButton(
                      type: NesButtonType.primary,
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Tambah',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Tambah Todo"),
        centerTitle: true,
      ),
      //
      //
      //Separated
      //
      //
      body: Container(
        child: Center(
          child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: ListView(
                children: [
                  TextField(
                    controller: _controllerOutlined,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.note_alt),
                      suffixIcon: _ClearButton(controller: _controllerOutlined),
                      labelText: 'Todo Name',
                      hintText: 'Daily Exam',
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    maxLines: 10,
                    controller: _controllerOutlined,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.assignment),
                      suffixIcon: _ClearButton(controller: _controllerOutlined),
                      labelText: 'Deskripsi Todo',
                      hintText: 'PPB Daily Exam Where Attended online record on Tomorrow Sunday',
                      border:OutlineInputBorder(),
                      filled: true,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class Lgnsec extends StatelessWidget {
  final TextEditingController _controllerOutlined = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //var appState = context.watch<Authage>();
    return SizedBox(
        width: 250,
        child: Column(
          children: [
            TextField(
              controller: _controllerOutlined,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.waving_hand),
                suffixIcon: _ClearButton(controller: _controllerOutlined),
                labelText: 'Username',
                hintText: 'Eric',
                border: OutlineInputBorder(),
                filled: true,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: _controllerOutlined,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.enhanced_encryption),
                suffixIcon: _ClearButton(controller: _controllerOutlined),
                labelText: 'Password',
                hintText: '*****************',
                border: OutlineInputBorder(),
                filled: true,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            NesButton(
              type: NesButtonType.primary,
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: Text(
                    'Login',
                    style: TextStyle(fontSize: 15),
                  )),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ],
        ));
  }
}

class Regsec extends StatelessWidget {
  final TextEditingController _controllerOutlined = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //var appState = context.watch<Authage>();
    return SizedBox(
        width: 250,
        child: Column(
          children: [
            TextField(
              controller: _controllerOutlined,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.waving_hand),
                suffixIcon: _ClearButton(controller: _controllerOutlined),
                labelText: 'Username',
                hintText: 'Eric',
                border: OutlineInputBorder(),
                filled: true,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: _controllerOutlined,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_open),
                suffixIcon: _ClearButton(controller: _controllerOutlined),
                labelText: 'Password',
                hintText: '*****************',
                border: OutlineInputBorder(),
                filled: true,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: _controllerOutlined,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.enhanced_encryption),
                suffixIcon: _ClearButton(controller: _controllerOutlined),
                labelText: 'Repeat',
                hintText: '*****************',
                border: OutlineInputBorder(),
                filled: true,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            NesButton(
              type: NesButtonType.primary,
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: Text(
                    'Register',
                    style: TextStyle(fontSize: 15),
                  )),
                  Icon(Icons.add),
                ],
              ),
            ),
          ],
        ));
  }
}
