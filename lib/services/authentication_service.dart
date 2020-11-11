import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future registerUser(String email, String password) async {
    try {
      var result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user != null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  logUserIn(String mail, String password) async {
    try {
      var user = await auth.signInWithEmailAndPassword(
        email: mail,
        password: password,
      );
      return user != null;
    } catch (e) {
      print(e);
    }
  }

  logOut() {
    return auth.signOut();
  }

  isUserLoggedIn() {
    if (auth.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }

  getUsersMail() {
    if (auth.currentUser != null) {
      return auth.currentUser.email;
    } else {}
  }
}
