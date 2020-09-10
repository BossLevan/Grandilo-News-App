import 'package:firebase_auth/firebase_auth.dart';
import 'package:grandilo_news_app/core/models/user_model.dart';

class Auth {
  FirebaseAuth _firebaseAuth;

  Auth({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<void> signIn(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> logOut() async {
    return Future.wait([_firebaseAuth.signOut()]);
  }

  Future<void> signUp(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<User> getUser() async {
    return User.parseFromFirebase(_firebaseAuth);
  }

  Future<bool> boolSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }
}
