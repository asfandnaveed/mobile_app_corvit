import 'package:flutter/material.dart';
import 'package:mobile_app_corvit/foodHomeScreen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OnBoardingSTF(),
    );
  }
}


class OnBoardingSTF extends StatefulWidget {
  const OnBoardingSTF({Key? key}) : super(key: key);

  @override
  State<OnBoardingSTF> createState() => _OnBoardingSTFState();
}

class _OnBoardingSTFState extends State<OnBoardingSTF> {
  late double width;
  late double height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
      child: Stack(
        children: [


          Container(
            width: width,
            height: height *0.63,

            child: Image.asset('assets/images/onBoardingCheif.png',
              fit: BoxFit.fill,
            ),
          ),

          Container(
            width: width,
            height: height *0.44,
            margin: EdgeInsets.only(top: height*0.54),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: height*0.05),
                  child: Text(
                    'The Fastest In',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        'Delivery',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        ' Food',
                        style: TextStyle(
                          color: Color(0xFFE81514),
                          fontSize: 30,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: height*0.03 ,left: width*0.05,right: width*0.05),
                  child: Text(
                    'Our job is to filling your tummy with delicious food and fast delivery',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 16,
                      fontFamily: 'poppins',

                    ),
                  ),
                ),
                Container(
                  width: width*0.55,
                  height: height*.07,
                  margin: EdgeInsets.only(top: height*0.04),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFE81514),
                      elevation: 9.0,
                      shadowColor: Color(0xFFE81514),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width*0.3)
                      ),
                    ),
                    onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>FoodHomeScreen())
                      );

                    },
                    child: Text('Get Started',
                     style: TextStyle(
                       fontFamily: 'poppins',
                       fontSize: 17,
                       fontWeight: FontWeight.w500
                     ),
                    ),
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}

