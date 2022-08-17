import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';



class FirebaseStorage extends StatelessWidget {
  const FirebaseStorage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirebaseStorage(),
    );
  }
}

class FirebaseStorageSTF extends StatefulWidget {
  const FirebaseStorageSTF({Key? key}) : super(key: key);

  @override
  State<FirebaseStorageSTF> createState() => _FirebaseStorageSTFState();
}

class _FirebaseStorageSTFState extends State<FirebaseStorageSTF> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

