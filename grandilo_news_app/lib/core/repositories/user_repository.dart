import 'package:grandilo_news_app/core/models/user_model.dart';
import 'package:grandilo_news_app/utils/auth/auth.dart';

class UserRepository {
  final Auth auth;

  UserRepository(this.auth);

  Future<User> getUser() async {
    return await auth.getUser();
  }

  Future<void> signIn(String email, String password) {
    return auth.signIn(email, password);
  }

  Future<void> signUp(String email, String password) async {
    return await auth.signUp(email, password);
  }

  Future<bool> boolSignedIn() async {
    return await auth.boolSignedIn();
  }

  Future<void> logOut() async {
    return await auth.logOut();
  }
}
