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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgt3L_EhJOaEaHs0QG2ebnitzKuw8Zbfc',
    appId: '1:838019629691:android:24dba10d67660dac7e18de',
    messagingSenderId: '838019629691',
    projectId: 'helpmetalk-3117f',
    storageBucket: 'helpmetalk-3117f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDRrIcncbhyuul2yNS96BS44of90p2KBS0',
    appId: '1:838019629691:ios:47d114b2a5f3dc0c7e18de',
    messagingSenderId: '838019629691',
    projectId: 'helpmetalk-3117f',
    storageBucket: 'helpmetalk-3117f.appspot.com',
    androidClientId: '838019629691-2oena099ejd6cd4gkhfrkcdoacerece2.apps.googleusercontent.com',
    iosClientId: '838019629691-1tn60pg2bvoluga50lm83cnpkrr8bqhd.apps.googleusercontent.com',
    iosBundleId: 'com.example.doctorChat',
  );
}
