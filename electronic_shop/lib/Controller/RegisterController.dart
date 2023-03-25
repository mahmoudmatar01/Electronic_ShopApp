import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widget/My_Alert.dart';

class RegisterController with ChangeNotifier{

  String?Email;
  String?Password;
  bool obcuretext=true;


  RegisterMethod(String Email2,String Password2) async{

    final CurrentUser=FirebaseAuth.instance.currentUser;
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: Email2,//Email!,
        password: Password2,//Password!,
      );
      if(CurrentUser==null){
        const Center(child: CircularProgressIndicator(color: Colors.black),
        );
      }
      Get.offNamed("/HomePage");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        MyAlert(
            Content: "The Password is too Weak").ShowAlert();
      }
      else if (e.code == 'email-already-in-use') {
        MyAlert(
            Content: "The account already exists for that email.").ShowAlert();
      }
      else{
        MyAlert(
            Content: "you Should Write Your Full Email",Subtitle: "Example: user11@Example.com").ShowAlert();
      }
    } catch (e) {

    }
    notifyListeners();
  }



}