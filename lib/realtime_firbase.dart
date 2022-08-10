import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


class FirebaseRealtime extends StatelessWidget {
  const FirebaseRealtime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FirebaseRealtimeSTF(),
    );
  }
}


class FirebaseRealtimeSTF extends StatefulWidget {
  const FirebaseRealtimeSTF({Key? key}) : super(key: key);

  @override
  State<FirebaseRealtimeSTF> createState() => _FirebaseRealtimeSTFState();
}

class _FirebaseRealtimeSTFState extends State<FirebaseRealtimeSTF> {

  DatabaseReference database = FirebaseDatabase.instance.ref();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: ()async{


                  await database.child('User/').push().set({
                    "name":"Ali",
                    "uid":"123",
                    "gender":"male",
                    "age":"26"

                  });



                },
                child: const Text(
                  'Send Data'
                ),
            ),
          ],
        ),
      ),
    );
  }
}

