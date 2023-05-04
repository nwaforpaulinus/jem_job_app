import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA_w9B8fbZ45V3_Qd1GeMTIBlDBBlpNw9k",
            authDomain: "jem-job-app.firebaseapp.com",
            projectId: "jem-job-app",
            storageBucket: "jem-job-app.appspot.com",
            messagingSenderId: "507229230559",
            appId: "1:507229230559:web:40e85c5fc55d108a2f606a",
            measurementId: "G-FBP6FPFZES"));
  } else {
    await Firebase.initializeApp();
  }
}
