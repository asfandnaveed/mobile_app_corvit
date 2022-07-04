import 'package:flutter/material.dart';
import 'package:mobile_app_corvit/sampleScreen.dart';

import 'package:animated_text_kit/animated_text_kit.dart';



class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                print('Cart Button Clicked');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>const Corvit())
                );
              },
              child: Container(
                width: 60,
                height: 60,
                margin: EdgeInsets.only(left: 300),
                child: Card(
                  elevation: 8.0,
                  child: Icon(Icons.shopping_cart_rounded),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            Container(
              height: 700,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, index){
                  return Stack(
                    children: [
                      /// Card Widget
                      Container(
                        width: 300,
                        margin: EdgeInsets.only(left: 25),
                        child: Card(
                          elevation: 9.0,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.only(topRight: Radius.circular(260.0)),
                          ),
                          child: Container(
                            height: 400,
                            child: Column(
                              children: [
                                Container(
                                  child: Image.asset('assets/images/shoes.png'),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10.0),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 15.0),
                                  child: Column(

                                    children: [
                                      Container(
                                        child: Text(
                                          'RS. 7000 /-',
                                          style: TextStyle(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.w600,

                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 15.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                '4.7',
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.star,
                                                  color: Colors.yellow.shade800,
                                                ),
                                                Icon(Icons.star,
                                                  color: Colors.yellow.shade800,),
                                                Icon(Icons.star,
                                                  color: Colors.yellow.shade800,),
                                                Icon(Icons.star,
                                                  color: Colors.yellow.shade800,),
                                                Icon(Icons.star_half,
                                                  color: Colors.yellow.shade800,),
                                              ],
                                            ),

                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.brown.withOpacity(0.6),
                                  width: 250,
                                  height: 2,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20.0),
                                  width: 250,
                                  height: 45,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.brown,
                                      shadowColor: Colors.brown.shade200,
                                      elevation: 6.0,
                                    ),
                                    onPressed: () {},
                                    child: Text('Add to Cart'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      ///Image
                      Container(
                        margin: EdgeInsets.only(left: 25,top: 10),
                        height: 50,
                        child: Image.asset('assets/images/banner.png'),
                      ),
                      /// Product Name
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        width: 40,
                        height: 350,
                        decoration: BoxDecoration(
                          color: Colors.brown.shade400,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(5.0),
                          ),
                        ),
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
                            child: DefaultTextStyle(
                              style: const TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w500,

                              ),
                              child: AnimatedTextKit(
                                repeatForever: true,
                                pause: Duration(milliseconds: 2000),
                                animatedTexts: [
                                  TypewriterAnimatedText('LEATHER SHOES',
                                    speed: Duration(milliseconds: 300),
                                  ),

                                ],
                                onTap: () {
                                  print("Tap Event");
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}