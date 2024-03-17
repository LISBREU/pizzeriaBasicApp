import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBf4mCQnsZwv7ekciaZe30WKMSJL39Aqoo",
            authDomain: "f-f-pizza-92vq9m.firebaseapp.com",
            projectId: "f-f-pizza-92vq9m",
            storageBucket: "f-f-pizza-92vq9m.appspot.com",
            messagingSenderId: "1054534326446",
            appId: "1:1054534326446:web:56fdd34db53d603b67b53f"));
  } else {
    await Firebase.initializeApp();
  }
}
