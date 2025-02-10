// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyB4KjnDqxcHofRreaA9pveeKg33tjHs5QA',
    appId: '1:249087729012:web:55d556b8d1c55362402021',
    messagingSenderId: '249087729012',
    projectId: 'chat-app-afad2',
    authDomain: 'chat-app-afad2.firebaseapp.com',
    storageBucket: 'chat-app-afad2.firebasestorage.app',
    measurementId: 'G-YSVJ6449Q0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDVJAQNNMpSraAfDF7t-7k31qCLwulcHjM',
    appId: '1:249087729012:android:ca4ca18e9cfa0f78402021',
    messagingSenderId: '249087729012',
    projectId: 'chat-app-afad2',
    storageBucket: 'chat-app-afad2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAIKXIOT1i13kXnYrbxflk9LkVWJOUiovo',
    appId: '1:249087729012:ios:213303b5ed35b78b402021',
    messagingSenderId: '249087729012',
    projectId: 'chat-app-afad2',
    storageBucket: 'chat-app-afad2.firebasestorage.app',
    iosBundleId: 'com.example.scholarChat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAIKXIOT1i13kXnYrbxflk9LkVWJOUiovo',
    appId: '1:249087729012:ios:213303b5ed35b78b402021',
    messagingSenderId: '249087729012',
    projectId: 'chat-app-afad2',
    storageBucket: 'chat-app-afad2.firebasestorage.app',
    iosBundleId: 'com.example.scholarChat',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB4KjnDqxcHofRreaA9pveeKg33tjHs5QA',
    appId: '1:249087729012:web:4884315c9fd8a735402021',
    messagingSenderId: '249087729012',
    projectId: 'chat-app-afad2',
    authDomain: 'chat-app-afad2.firebaseapp.com',
    storageBucket: 'chat-app-afad2.firebasestorage.app',
    measurementId: 'G-FKT3CBYYLD',
  );
}
