
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.

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
    apiKey: 'AIzaSyBXqkNxH9AysTMO5WXUpnPBb-tAqZnpSkI',
    appId: '1:140184760902:web:82d016c160eb9e7f7cd047',
    messagingSenderId: '140184760902',
    projectId: 'anotherbike-5471e',
    authDomain: 'anotherbike-5471e.firebaseapp.com',
    storageBucket: 'anotherbike-5471e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyADtS2lMphXVPSyJnwG_J4d8GOjJcr1nRM',
    appId: '1:140184760902:android:34a5707c0766b4307cd047',
    messagingSenderId: '140184760902',
    projectId: 'anotherbike-5471e',
    storageBucket: 'anotherbike-5471e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7Sf1_mqGR_nRQu0LuLS0lX7a79WkQPHc',
    appId: '1:140184760902:ios:bd87a5cf8f40c0a17cd047',
    messagingSenderId: '140184760902',
    projectId: 'anotherbike-5471e',
    storageBucket: 'anotherbike-5471e.appspot.com',
    iosBundleId: 'com.example.bikeComm',
  );
}
