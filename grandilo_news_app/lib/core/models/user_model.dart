import 'package:firebase_auth/firebase_auth.dart';

class User {
  String name;
  String email;
  String uid;
  bool isSignedIn;

  User({this.isSignedIn, this.name, this.uid, this.email});

  //static constructor to make it easier to access this
  //methos without instatiationg this class
  static Future<User> parseFromFirebase(FirebaseAuth user) async {
    final currentUser = await user.currentUser();
    return user != null
        ? User(
            name: currentUser.displayName,
            email: currentUser.email,
            uid: currentUser.uid)
        : null;
  }
}
