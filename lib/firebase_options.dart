// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD2IHj4WOag4v_iBc6iQvCfMGjtt-ccDo8',
    appId: '1:928071065723:web:8f2cb8535a7ae2e2e082de',
    messagingSenderId: '928071065723',
    projectId: 'heryfb-tgkuliah',
    authDomain: 'heryfb-tgkuliah.firebaseapp.com',
    storageBucket: 'heryfb-tgkuliah.appspot.com',
    measurementId: 'G-LKL2W4YJ77',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFosDhHAQkuu2uTmh9mCoHIJxQloCM3MM',
    appId: '1:928071065723:android:492f875e85899fcce082de',
    messagingSenderId: '928071065723',
    projectId: 'heryfb-tgkuliah',
    storageBucket: 'heryfb-tgkuliah.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBD9N_JjZZcyvaaA5-o9qJe_XqfetDQ-UE',
    appId: '1:928071065723:ios:4142942dcc085f6de082de',
    messagingSenderId: '928071065723',
    projectId: 'heryfb-tgkuliah',
    storageBucket: 'heryfb-tgkuliah.appspot.com',
    iosBundleId: 'com.example.smt3finalpk',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBD9N_JjZZcyvaaA5-o9qJe_XqfetDQ-UE',
    appId: '1:928071065723:ios:da4900330a493a65e082de',
    messagingSenderId: '928071065723',
    projectId: 'heryfb-tgkuliah',
    storageBucket: 'heryfb-tgkuliah.appspot.com',
    iosBundleId: 'com.example.smt3finalpk.RunnerTests',
  );
}
