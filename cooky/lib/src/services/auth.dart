import 'package:cooky/src/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user based on FireBaseUser
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

      //auth change user change
    Stream<User> get user {
      return _auth.onAuthStateChanged
       .map(_userFromFirebaseUser);
    }

  //sign in anon
  Future signInAnon() async{
    try{
       AuthResult result= await _auth.signInAnonymously();
       FirebaseUser user = result.user;
       return _userFromFirebaseUser(user);
    } catch(e){

        print(e.toString());
        return null;
    }

  }

  //sign in with email & pw

  //reg with email & pw
  Future registerWithEmailAndPassword(String email , String password) async {
    try{
      AuthResult result= await _auth.createUserWithEmailAndPassword(email: email,password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);

    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try{

      return await _auth.signOut();

    } catch(e){

      print(e.toString());
      return null;

    }
  }
  

}