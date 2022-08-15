import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginRegister extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginRegister_STF(),
    );
  }
}

class LoginRegister_STF extends StatefulWidget {



  @override
  _LoginRegister_STFState createState() => _LoginRegister_STFState();
}

class _LoginRegister_STFState extends State<LoginRegister_STF> {

  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController code = TextEditingController();


  void registerUser() async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: "asfand@example.com",
          password: "SuperSecretPassword!"
      );
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

  void phoneAuth() async{

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    phoneAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Center(
          child: TextField(
            controller: code,
          ),
        ),
      ),
    );
  }
}
