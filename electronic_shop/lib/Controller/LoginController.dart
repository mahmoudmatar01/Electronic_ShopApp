import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widget/My_Alert.dart';

class LoginControl with ChangeNotifier{

  String?Email;
  String?PassWord;
  bool obscuretext=true;


  LoginMethod(String Email2,String Password2) async {

  final CurrentUser=FirebaseAuth.instance.currentUser;

  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  email: Email2,
  password: Password2
  );
  if(CurrentUser==null){
  const Center(child: CircularProgressIndicator(color: Colors.black),
  );
  }
  Get.offNamed("/HomePage");
  } on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
  MyAlert(Content: "No user found for that email.").ShowAlert();
  } else if (e.code == 'wrong-password') {
  MyAlert(Content: "Wrong password provided for that user.").ShowAlert();
  }
  else{
  MyAlert(Content: "Not Complete Email").ShowAlert();
  }
  }

  notifyListeners();
  }



}