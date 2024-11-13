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
    apiKey: 'AIzaSyA1SkjMtAg0jUL-XR5h7FHjwXiHA2AoU9k',
    appId: '1:848156040550:web:d397cd0ca5b0455e89fca7',
    messagingSenderId: '848156040550',
    projectId: 'trackitride',
    authDomain: 'trackitride.firebaseapp.com',
    storageBucket: 'trackitride.firebasestorage.app',
    measurementId: 'G-XGPJ7099V1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvnqRlr6rryWZEuzPhPuYO06mb26kEqks',
    appId: '1:848156040550:android:75cd7ad2c5b9114f89fca7',
    messagingSenderId: '848156040550',
    projectId: 'trackitride',
    storageBucket: 'trackitride.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNb07Hc17gA9QymTGmlRI12AsZHofKEIY',
    appId: '1:848156040550:ios:515d784ddc9adeaf89fca7',
    messagingSenderId: '848156040550',
    projectId: 'trackitride',
    storageBucket: 'trackitride.firebasestorage.app',
    iosBundleId: 'com.example.trackItRide',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDNb07Hc17gA9QymTGmlRI12AsZHofKEIY',
    appId: '1:848156040550:ios:515d784ddc9adeaf89fca7',
    messagingSenderId: '848156040550',
    projectId: 'trackitride',
    storageBucket: 'trackitride.firebasestorage.app',
    iosBundleId: 'com.example.trackItRide',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA1SkjMtAg0jUL-XR5h7FHjwXiHA2AoU9k',
    appId: '1:848156040550:web:97439e593c80801989fca7',
    messagingSenderId: '848156040550',
    projectId: 'trackitride',
    authDomain: 'trackitride.firebaseapp.com',
    storageBucket: 'trackitride.firebasestorage.app',
    measurementId: 'G-H5SYSHRRWS',
  );
}