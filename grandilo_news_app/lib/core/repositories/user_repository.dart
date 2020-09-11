import 'package:grandilo_news_app/core/models/user_model.dart';
import 'package:grandilo_news_app/utils/auth/auth.dart';

class UserRepository {
  final Auth auth;

  UserRepository(this.auth);

  //method to get the current user in session
  Future<User> getUser() async {
    return await auth.getUser();
  }

  //method to sign in the user
  Future<void> signIn(String email, String password) {
    return auth.signIn(email, password);
  }

  //method for the user to sign up
  Future<void> signUp(String email, String password) async {
    return await auth.signUp(email, password);
  }

  //method to check if the user is signed in
  Future<bool> boolSignedIn() async {
    return await auth.boolSignedIn();
  }

  //method to log out the user
  Future<void> logOut() async {
    return await auth.logOut();
  }
}
