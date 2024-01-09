import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SenacFirebaseUser {
  SenacFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

SenacFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SenacFirebaseUser> senacFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<SenacFirebaseUser>(
      (user) {
        currentUser = SenacFirebaseUser(user);
        return currentUser!;
      },
    );
