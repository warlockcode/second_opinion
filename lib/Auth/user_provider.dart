import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserProvider extends ChangeNotifier {
  var googleSignIn = GoogleSignIn();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLogedIn = false;

  void setIsloogedIn(bool state) {
    isLogedIn = state;
    notifyListeners();
  }

  bool _isGoogleUser = false;
  String status = "not started";
  Future login() async {
    try {
      final user = await googleSignIn.signIn();
      if (user != null) {
        final googleAuth = await user.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential? userCred = await _auth.signInWithCredential(credential);
        _isGoogleUser = true;
        setIsloogedIn(true);
        User? currentUser = userCred.user;
        if (currentUser != null) {
          currentUser.updateDisplayName(user.displayName);
          currentUser.updatePhotoURL(user.photoUrl);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  bool checkUserType() {
    return _isGoogleUser;
  }

  void logout() async {
    await googleSignIn.disconnect();
    _auth.signOut();
    setIsloogedIn(false);
  }

  var _screenHeight;

  void kSetScreenHeight(var screenHeight) {
    _screenHeight = screenHeight;
  }

  kGetScreenHeight() {
    return _screenHeight;
  }

  void kSetPaymentStatus(String status) {
    this.status = status;
    notifyListeners();
  }

  String kGetPaymentStatus() {
    return status;
  }
}
