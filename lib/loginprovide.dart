import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:online_storage/model/user_model.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

class LoginProvider extends ChangeNotifier {
  // created class shortcut

  final _auth = FirebaseAuth.instance;

  final _db = FirebaseFirestore.instance;
// create user
  createUser(
      // required argument added to the function
      {required String emailid,
      required String name,
      required String mobileNumber,
      required String password}) async {
    try {
      // Firebaeseinstance.createuser

      await _auth
          // passed values from function variables

          // when we arre using future function we will get then method
          .createUserWithEmailAndPassword(email: emailid, password: password)
          .then((value) {
        // our user model object created
        // object created
        //

        final user = UserModel(
            name: name,
            email: emailid,
            mobileNumber: mobileNumber,
            uid: _auth.currentUser!.uid.toString());

// created a map
        Map<String, dynamic> userData = {
          "username": user.name,
          "userEmail": user.email,
          "userMobileNumber": user.mobileNumber,
          "userID": user.uid,
        };
// added data to the database
// got database and check the path name is ther
// if not there create a database on the same name
// goto the collection (user) crete the data as json object

        return _db
            .collection('User')
            .add(userData)
            .then((value) => print('data saved'));
      });
    } catch (error) {
      log(error.toString());
    }
  }
}

/// exceptions handling // error handling.
///
/// we writed the code insider try block.
///
/// if is there any error occured catch will catch error and perform other actions.

