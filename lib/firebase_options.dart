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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA8zZjuL3ZwF8eFuXsD_cpgMqAIx3JSQDI',
    appId: '1:55561937958:web:3055f0bc80408974dd32e7',
    messagingSenderId: '55561937958',
    projectId: 'convenient-store-management',
    authDomain: 'convenient-store-management.firebaseapp.com',
    databaseURL: 'https://convenient-store-management-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'convenient-store-management.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBeKCWHzVGiDA7E2krCTvgleLfKX6_hrBg',
    appId: '1:55561937958:android:d3c233bd2222eb99dd32e7',
    messagingSenderId: '55561937958',
    projectId: 'convenient-store-management',
    databaseURL: 'https://convenient-store-management-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'convenient-store-management.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCa1QnYZFDW9G8yGyOs0cGAsrwEeMkGMIo',
    appId: '1:55561937958:ios:7b41cf6b949fe3e0dd32e7',
    messagingSenderId: '55561937958',
    projectId: 'convenient-store-management',
    databaseURL: 'https://convenient-store-management-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'convenient-store-management.appspot.com',
    iosClientId: '55561937958-81qq6tkvrh8p408pp13kckvvr8i29nqm.apps.googleusercontent.com',
    iosBundleId: 'com.duong.management.shop.convenientStoreManagement',
  );
}
