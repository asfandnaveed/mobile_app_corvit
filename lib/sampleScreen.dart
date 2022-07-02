import 'package:flutter/material.dart';

class Corvit extends StatelessWidget {
  const Corvit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset('assets/images/perfume.png'),
            Container(
              margin: EdgeInsets.only(left: 150.0,top: 150),
              child: Text('Perfume'),
            ),

            Container(
              height: 350,
              child: Image.asset('assets/images/shirt.png'),
            ),
          ],
        ),
      ),
    );
  }
}
