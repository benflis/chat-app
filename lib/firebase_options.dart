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
    apiKey: 'AIzaSyDxMRqnNmAAru1NUhBSx_gmTU2IfuAfLeI',
    appId: '1:506346345821:web:c7f01fabb32955c38944b4',
    messagingSenderId: '506346345821',
    projectId: 'flash-chat-77033',
    authDomain: 'flash-chat-77033.firebaseapp.com',
    storageBucket: 'flash-chat-77033.appspot.com',
    measurementId: 'G-7Y7FVJFQNP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBH4tF2cNV-H1QGzpFnAUuEk7ZB9JuVNGU',
    appId: '1:506346345821:android:57922f76cd1b13218944b4',
    messagingSenderId: '506346345821',
    projectId: 'flash-chat-77033',
    storageBucket: 'flash-chat-77033.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDahkjc22xATPPtE1eUq5-Wn2x9gUZUrH0',
    appId: '1:506346345821:ios:456e1ed365c53ebf8944b4',
    messagingSenderId: '506346345821',
    projectId: 'flash-chat-77033',
    storageBucket: 'flash-chat-77033.appspot.com',
    iosClientId: '506346345821-nm945lhgmttnj9kfmuj4um1v0r23vbl5.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDahkjc22xATPPtE1eUq5-Wn2x9gUZUrH0',
    appId: '1:506346345821:ios:456e1ed365c53ebf8944b4',
    messagingSenderId: '506346345821',
    projectId: 'flash-chat-77033',
    storageBucket: 'flash-chat-77033.appspot.com',
    iosClientId: '506346345821-nm945lhgmttnj9kfmuj4um1v0r23vbl5.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp',
  );
}
