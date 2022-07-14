import 'package:flutter/material.dart';

class FoodHomeScreen extends StatelessWidget {
  const FoodHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FoodHomeSTF(),
    );
  }
}

class FoodHomeSTF extends StatefulWidget {
  const FoodHomeSTF({Key? key}) : super(key: key);

  @override
  State<FoodHomeSTF> createState() => _FoodHomeSTFState();
}

class _FoodHomeSTFState extends State<FoodHomeSTF> {

  late double width;
  late double height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    width: height*0.07,
                    height: height*0.07,
                    child: Card(
                      color:Colors.grey.shade300 ,
                      child: Icon(
                        Icons.restaurant_menu
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

