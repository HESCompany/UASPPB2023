import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Login Sederhana',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String isUserLoggedIn() {
    // **Ambil objek pengguna saat ini**

    // **Kembalikan nilai true jika pengguna sudah login**
    final String email =
        FirebaseAuth.instance.currentUser!.email ?? "none detected";
    final String content = "testdata";

    final colc = FirebaseFirestore.instance.collection('Todos');
    final String id = FirebaseAuth.instance.currentUser!.uid;

    /*colc.doc(id).collection('Users').doc(colc.doc().id).set({
      'docId': FirebaseFirestore.instance
          .collection('Todos')
          .doc(FirebaseAuth.instance.currentUser!.uid),
      'isinya': content,
    });*/

    colc.doc(id).collection('Users').add({
      'docId': FirebaseFirestore.instance
          .collection('Todos')
          .doc(FirebaseAuth.instance.currentUser!.uid),
      'isinya': content,
    });

    return FirebaseAuth.instance.currentUser!.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Login Sederhana'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _onLoginPressed,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  void _onLoginPressed() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Redirect ke halaman lain setelah berhasil login
      print(isUserLoggedIn());
    } catch (e) {
      // Tampilkan pesan kesalahan
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }
}
