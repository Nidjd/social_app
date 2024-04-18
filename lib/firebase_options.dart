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
    apiKey: 'AIzaSyC-pXOaSg9tsv9z9E5qIQeR0WqJAQmuWGU',
    appId: '1:851507388497:web:f91f599585db4cc34e1870',
    messagingSenderId: '851507388497',
    projectId: 'social-app-3a5ca',
    authDomain: 'social-app-3a5ca.firebaseapp.com',
    storageBucket: 'social-app-3a5ca.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBN8C05di9-O4u2WOKkWrnI_1LnUnJ8ouk',
    appId: '1:851507388497:android:37ed299078cf648a4e1870',
    messagingSenderId: '851507388497',
    projectId: 'social-app-3a5ca',
    storageBucket: 'social-app-3a5ca.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgRTIicc8ut8jNIYPCcSZMiKiRdQLEOQs',
    appId: '1:851507388497:ios:8343c21d9b253e384e1870',
    messagingSenderId: '851507388497',
    projectId: 'social-app-3a5ca',
    storageBucket: 'social-app-3a5ca.appspot.com',
    iosBundleId: 'com.example.socialMedia',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgRTIicc8ut8jNIYPCcSZMiKiRdQLEOQs',
    appId: '1:851507388497:ios:8343c21d9b253e384e1870',
    messagingSenderId: '851507388497',
    projectId: 'social-app-3a5ca',
    storageBucket: 'social-app-3a5ca.appspot.com',
    iosBundleId: 'com.example.socialMedia',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC-pXOaSg9tsv9z9E5qIQeR0WqJAQmuWGU',
    appId: '1:851507388497:web:7e276b5e47ad189b4e1870',
    messagingSenderId: '851507388497',
    projectId: 'social-app-3a5ca',
    authDomain: 'social-app-3a5ca.firebaseapp.com',
    storageBucket: 'social-app-3a5ca.appspot.com',
  );
}
