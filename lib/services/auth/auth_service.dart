

import "dart:developer";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";


class AuthService
{
  //instance of firebase auth
  final FirebaseAuth _auth  = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get the current user
  User? getCurrentUser()
  {
    return _auth.currentUser;
  }

  //signin method
  Future<UserCredential> signInWithEmailAndPassword(email,password)async{
      try {
          UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
          
          //also add the user to firestore
        _firestore.collection("Merchant").doc(userCredential.user!.uid).set({
          "uid" :userCredential.user!.uid,
          "email":email,
        });
        
          return userCredential;
      }
      on FirebaseAuthException catch(e) {
        log("i am here inside the log");
          throw Exception(e.code);
      }
    
      
    }
     //signup method
    Future<UserCredential> signUpWithEmailAndPassword(String email,String password,String firstname,String lastname,String username,String phonenumber)async
    {
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

        //also add the user to firestore
        _firestore.collection("Merchant").doc(userCredential.user!.uid).set({
          "uid" :userCredential.user!.uid,
          "email":email,
          "firstname":firstname,
          "lastname":lastname,
          "username":username,
          "phonenumber":phonenumber,
        });

        return userCredential;
      } on FirebaseAuthException catch (e) {
        throw Exception(e.code);
      }
    }

     //sign out method
    Future<void> signOut()async{
      return await _auth.signOut();
    }
      //erros

}
 