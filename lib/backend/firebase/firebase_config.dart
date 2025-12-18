import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyASn58EzqT7cJG386LTrOC3eHO3IR_LNlQ",
            authDomain: "mobile-installer-8g06wc.firebaseapp.com",
            projectId: "mobile-installer-8g06wc",
            storageBucket: "mobile-installer-8g06wc.firebasestorage.app",
            messagingSenderId: "1079799191630",
            appId: "1:1079799191630:web:54b6242d0b591786cccb1f"));
  } else {
    await Firebase.initializeApp();
  }
}
