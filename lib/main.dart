import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:indexed/indexed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

//styling account button
//styling dialog

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => MainApp0();
}

class MainApp0 extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: flutterNesTheme(),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Mainpage();
            } else {
              return Authage();
            }
          },
        )
        //Authgate(),
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
  bool todoisdone = false;
  int selectedIndex = 0;
  final colc = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Todos');

  final FirebaseAuth auth = FirebaseAuth.instance;
  void logout() async {
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    Widget section;
    switch (selectedIndex) {
      case 0:
        section = Todosec();
        break;
      case 1:
        section = Emptysec();
        break;
      case 2:
        section = Emptysec();
        break;
      case 3:
        section = Sayasec();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
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
                                onPressed: () {
                                  logout();
                                },
                              ),
                              MenuItemButton(
                                child: Text('Logout'),
                                onPressed: () {
                                  logout();
                                },
                              ),
                            ]),
                          )
                        ],
                      ),
                      Text(
                          "${FirebaseAuth.instance.currentUser!.email?.split('@').first}",
                          style: TextStyle(color: Colors.white)),
                    ],
                  )),
            )
          ],
        ),
        body: section,

        /*ListView(padding: EdgeInsets.all(4), children: [
          listitem,
          listitem,
          listitem,
          listitem,
          listitem,
          listitem,
          SizedBox(
            height: 80,
          ),
        ]),*/
        floatingActionButton: Column(
          verticalDirection: VerticalDirection.up,
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
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: NesButton(
                    type: NesButtonType.success,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (contain) => Todoform(),
                          ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(Icons.add),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}

class ClearField extends StatelessWidget {
  const ClearField({required this.controller});

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

class Todosec extends StatefulWidget {
  const Todosec({super.key});
  @override
  State<Todosec> createState() => Todosec0();
}

class Todosec0 extends State<Todosec> {
  final colc = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Todos');

  final FirebaseAuth auth = FirebaseAuth.instance;
  void openDialog(BuildContext context, Todos item) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Yakin mau menghapus ${item.judul}"),
        actions: <Widget>[
          TextButton(
            child: const Text('Batal'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FilledButton(
            child: const Text('Yakin !!..'),
            onPressed: () {
              colc.doc(item.id).delete();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void flip(id, bool wesbar) async {
    try {
      colc.doc(id).update({'barporung': wesbar});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    //var appState = context.watch<Authage>();
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: colc.snapshots(),
      builder: (context, snapshot) {
        //code
        if (!snapshot.hasData) {
          return Center(child: Text("None"));
        } else {
          List<Todos> datapool = snapshot.data!.docs.map((document) {
            return Todos(
                judul: document['judule'],
                desc: document['descne'],
                isdone: document['barporung'],
                id: document.id);
          }).toList();
          if (datapool.length > 0) {
            return ListView.builder(
              itemCount: datapool.length,
              itemBuilder: (context, index) {
                final datapiece = datapool[index];
                //card
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: NesContainer(
                    padding: EdgeInsets.all(4),
                    backgroundColor: Colors.transparent,
                    child: ListTile(
                      minVerticalPadding: 0,
                      contentPadding: EdgeInsets.all(0),
                      title: Column(children: [
                        ListTile(
                          tileColor: Colors.blue,
                          title: Column(children: [
                            ListTile(
                              minVerticalPadding: 0,
                              contentPadding: EdgeInsets.all(0),
                              textColor: Colors.white,
                              title: Text(datapiece.judul),
                            ),
                            ListTile(
                              minVerticalPadding: 0,
                              tileColor: Colors.white,
                              subtitle: Text(datapiece.desc),
                            )
                          ]),
                        ),
                        ListTile(
                          tileColor: Colors.blue,
                          trailing: Checkbox(
                            fillColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (!states.contains(MaterialState.selected)) {
                                return Colors.white;
                              }
                            }),
                            tristate: true,
                            value: datapiece.isdone,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  flip(datapiece.id, value);
                                } else {
                                  flip(datapiece.id, false);
                                }
                              });
                            },
                          ),
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                style: ButtonStyle(iconColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  return Colors.white;
                                }), backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  return Colors.black45;
                                }), shape:
                                    MaterialStateProperty.resolveWith((states) {
                                  return BeveledRectangleBorder();
                                })),
                                icon: Icon(Icons.mode_edit),
                                color: Colors.white,
                                tooltip: 'Edit',
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (contain) =>
                                            Todochange(param: datapiece),
                                      ));
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                child: IconButton(
                                  style: ButtonStyle(iconColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) {
                                    return Colors.white;
                                  }), backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) {
                                    return Color.fromARGB(255, 155, 0, 0);
                                  }), shape: MaterialStateProperty.resolveWith(
                                      (states) {
                                    return BeveledRectangleBorder();
                                  })),
                                  icon: Icon(Icons.delete),
                                  color: Colors.white,
                                  tooltip: 'Hapus',
                                  onPressed: () {
                                    openDialog(context, datapiece);
                                  },
                                ),
                              )
                            ],
                          ),
                          title:
                              datapiece.isdone ? Text("Sudah") : Text("Belum"),
                        )
                      ]),
                      tileColor: Colors.blue,
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text("None"));
          }
        }
      },
    );
  }
}

class Emptysec extends StatefulWidget {
  const Emptysec({super.key});
  @override
  State<Emptysec> createState() => Emptysec0();
}

class Emptysec0 extends State<Emptysec> {
  @override
  Widget build(BuildContext context) {
    //var appState = context.watch<Authage>();
    return Center(child: Text("None"));
  }
}

class Sayasec extends StatefulWidget {
  const Sayasec({super.key});
  @override
  State<Sayasec> createState() => Sayasec0();
}

class Sayasec0 extends State<Sayasec> {
  @override
  Widget build(BuildContext context) {
    //var appState = context.watch<Authage>();
    return Container(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.person,size: 100,),
            ListTile(
              title: Center(
                  child: Text(FirebaseAuth.instance.currentUser!.email.toString(), style: TextStyle(fontSize: 20))),
            ),
            SizedBox(
              height: 5,
            ),
            ListTile(
              title: Center(
                  child: Text(FirebaseAuth.instance.currentUser!.email.toString().split('@').first, style: TextStyle(fontSize: 20))),
            ),
            SizedBox(
              height: 100,
            ),
            ListTile(
              title: Center(
                  child: Text("Copyright@A11.2022.14237", style: TextStyle(fontSize: 10)))
            ),
            ListTile(
              title: Center(
                  child: Text("Heryawan Eko Saputro", style: TextStyle(fontSize: 10)))
            )
          ]),
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
  final TextEditingController Judul = TextEditingController();
  final TextEditingController Descp = TextEditingController();
  final colc = FirebaseFirestore.instance.collection('Users');

  void Tambah() async {
    try {
      final id = colc.doc().id;
      colc
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Todos')
          .doc(id)
          .set({
        'judule': Judul.text,
        'descne': Descp.text,
        'barporung': false,
        'idne': id,
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: NesButton(
          type: NesButtonType.primary,
          onPressed: () {
            Tambah();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contain) => MainApp(),
                ));
          },
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
      body: Container(
        child: Center(
          child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: ListView(
                children: [
                  TextField(
                    controller: Judul,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.note_alt),
                      suffixIcon: ClearField(controller: Judul),
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
                    controller: Descp,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.assignment),
                      suffixIcon: ClearField(controller: Descp),
                      labelText: 'Deskripsi Todo',
                      hintText:
                          'PPB Daily Exam Where Attended online record on Tomorrow Sunday',
                      border: OutlineInputBorder(),
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

class Todochange extends StatefulWidget {
  Todos param;
  Todochange({super.key, required this.param});
  @override
  State<Todochange> createState() => Todochange0();
}

class Todochange0 extends State<Todochange> {
  final colc = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Todos');
  final TextEditingController Edittitle = TextEditingController();
  final TextEditingController Editdesc = TextEditingController();
  void execme() {
    Edittitle.text = widget.param.judul;
    Editdesc.text = widget.param.desc;
  }

  void Save() async {
    try {
      if (Edittitle.text != "" && Editdesc.text != "") {
        colc
            .doc(widget.param.id)
            .update({'judule': Edittitle.text, 'descne': Editdesc.text});
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    execme();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: NesButton(
          type: NesButtonType.primary,
          onPressed: () {
            Save();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contain) => MainApp(),
                ));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Simpan',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Edit Todo"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: ListView(
                children: [
                  TextField(
                    controller: Edittitle,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.note_alt),
                      suffixIcon: ClearField(controller: Edittitle),
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    maxLines: 10,
                    controller: Editdesc,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.assignment),
                      suffixIcon: ClearField(controller: Editdesc),
                      border: OutlineInputBorder(),
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

class Lgnsec extends StatefulWidget {
  const Lgnsec({super.key});
  @override
  State<Lgnsec> createState() => Lgnsec0();
}

class Lgnsec0 extends State<Lgnsec> {
  final TextEditingController Name = TextEditingController();
  final TextEditingController Pass = TextEditingController();
  bool hidetext = true;

  final FirebaseAuth auth = FirebaseAuth.instance;
  void login() async {
    await auth.signInWithEmailAndPassword(
      email: Name.text,
      password: Pass.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    //var appState = context.watch<Authage>();
    return SizedBox(
        width: 250,
        child: Column(
          children: [
            TextField(
              controller: Name,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.waving_hand),
                suffixIcon: ClearField(controller: Name),
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
              enableInteractiveSelection: false,
              controller: Pass,
              obscureText: hidetext,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.enhanced_encryption),
                suffixIcon: IconButton(
                  icon: hidetext
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  onPressed: () {
                    setState(() {
                      if (hidetext) {
                        hidetext = false;
                      } else {
                        hidetext = true;
                      }
                    });
                  },
                ),
                labelText: 'Password',
                hintText: '*****************',
                hintStyle: TextStyle(overflow: TextOverflow.clip),
                border: OutlineInputBorder(),
                filled: true,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            NesButton(
              type: NesButtonType.primary,
              onPressed: () {
                login();
              },
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

class Regsec extends StatefulWidget {
  const Regsec({super.key});
  @override
  State<Regsec> createState() => Regsec0();
}

class Regsec0 extends State<Regsec> {
  final TextEditingController Name = TextEditingController();
  final TextEditingController Pass = TextEditingController();
  final TextEditingController Reat = TextEditingController();
  bool hidetext = true;

  final FirebaseAuth auth = FirebaseAuth.instance;
  void regist() async {
    if (Pass.text == Reat.text) {
      await auth.createUserWithEmailAndPassword(
          email: Name.text, password: Pass.text);
      await auth.signInWithEmailAndPassword(
        email: Name.text,
        password: Pass.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //var appState = context.watch<Authage>();
    return SizedBox(
        width: 250,
        child: Column(
          children: [
            TextField(
              controller: Name,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.waving_hand),
                suffixIcon: ClearField(controller: Name),
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
              controller: Pass,
              enableInteractiveSelection: false,
              obscureText: hidetext,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_open),
                suffixIcon: IconButton(
                  icon: hidetext
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  onPressed: () {
                    setState(() {
                      if (hidetext) {
                        hidetext = false;
                      } else {
                        hidetext = true;
                      }
                    });
                  },
                ),
                labelText: 'Password',
                hintText: '*****************',
                hintStyle: TextStyle(overflow: TextOverflow.clip),
                border: OutlineInputBorder(),
                filled: true,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: Reat,
              enableInteractiveSelection: false,
              obscureText: hidetext,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.enhanced_encryption),
                suffixIcon: ClearField(controller: Reat),
                labelText: 'Repeat',
                hintText: '*****************',
                hintStyle: TextStyle(overflow: TextOverflow.clip),
                border: OutlineInputBorder(),
                filled: true,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            NesButton(
              type: NesButtonType.primary,
              onPressed: () {
                regist();
              },
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

class Todos {
  final String judul;
  final String desc;
  final bool isdone;
  final String id;

  Todos(
      {required this.judul,
      required this.desc,
      required this.isdone,
      required this.id});
}
