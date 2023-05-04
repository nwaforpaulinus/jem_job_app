import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class JemJobAppFirebaseUser {
  JemJobAppFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

JemJobAppFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<JemJobAppFirebaseUser> jemJobAppFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<JemJobAppFirebaseUser>(
      (user) {
        currentUser = JemJobAppFirebaseUser(user);
        return currentUser!;
      },
    );
