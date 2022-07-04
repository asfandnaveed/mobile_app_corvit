import 'package:flutter/material.dart';


class MedicalHomeScreen extends StatelessWidget {
  const MedicalHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MedicalHomeScreenSTF(),
    );
  }
}


class MedicalHomeScreenSTF extends StatefulWidget {
  const MedicalHomeScreenSTF({Key? key}) : super(key: key);

  @override
  State<MedicalHomeScreenSTF> createState() => _MedicalHomeScreenSTFState();
}

class _MedicalHomeScreenSTFState extends State<MedicalHomeScreenSTF> {

  late double width;
  late double height;

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.lightBlue,
      height: height *0.5,
      width: width * 0.5,
      margin: EdgeInsets.only(left: width*0.5 ),
    );
  }
}

