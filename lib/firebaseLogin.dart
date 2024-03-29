import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_app_corvit/SocialHomeScreen.dart';
import 'package:mobile_app_corvit/registerScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LoginScreenStf(),
    );
  }
}


class LoginScreenStf extends StatefulWidget {
  const LoginScreenStf({Key? key}) : super(key: key);

  @override
  State<LoginScreenStf> createState() => _LoginScreenStfState();
}

class _LoginScreenStfState extends State<LoginScreenStf> {
  late double width;
  late double height;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() async{





  }

  void phoneAuth() async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+923124602030',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  initState(){
    super.initState();

    if(FirebaseAuth.instance.currentUser !=null){

    }

  }

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Container(
      child: Stack(
        children: [
          ///Top right Image
          Container(
            margin: EdgeInsets.only(top: height*0.045,left: width*0.35),
            width: width*0.7,
            child: Image.asset('assets/images/facial_product.png'),
          ),

          ///Bottom Left Image
          Container(
            height: height*0.8,
            margin: EdgeInsets.only(top: height*0.6,left: width*0.54),
            child: Image.asset('assets/images/Herb.png'),
          ),

          ///Bottom Left Image 2
          // Container(
          //   height: height,
          //   width: width,
          //   margin: EdgeInsets.only(top: height*0.55),
          //   child: Image.asset('assets/images/leaf_fall_4.gif'),
          // ),
          // Container(
          //   height: height,
          //   width: width,
          //
          //   child: Image.asset('assets/images/leaf_fall_4.gif'),
          // ),

          ///Sign In Screen
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, 'SignUp');
            },
            child: Container(
              margin: EdgeInsets.only(top: height*0.08,left: width*0.02),
              child: Row(
                children: [
                  Container(
                    child: Icon(
                        Icons.arrow_back_rounded
                    ),
                  ),
                  Container(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontFamily: 'poppins'
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ///User Data
          Container(
            margin: EdgeInsets.only(top: height*0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: width*0.08,bottom: height*0.02),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                /// Email Input
                Container(
                  margin: EdgeInsets.only(left: width*0.08,top: height*0.03),
                  child: TextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    style: TextStyle(
                      fontFamily: 'poppins',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter Email',
                      hintStyle: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                /// Under Line
                Container(
                  height: height*0.002,
                  width: width*0.8,
                  color: Color(0xFFAcA9B2),
                ),
                /// Password Input
                Container(
                  margin: EdgeInsets.only(left: width*0.08,top: height*0.03),
                  child: TextField(
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    autofocus: false,
                    style: TextStyle(
                      fontFamily: 'poppins',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                /// Under Line
                Container(
                  height: height*0.002,
                  width: width*0.65,
                  color: Color(0xFFAcA9B2),
                ),

                /// Forgot Pass
                Container(
                  margin: EdgeInsets.only(left: width*0.08,top: height*0.04),
                  child:Text(
                    'Forgot Password ?',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey
                    ),
                  ),
                ),
              ],
            ),
          ),

          ///Login button
          Container(
            width: width*0.5,
            height: height*0.07,
            margin: EdgeInsets.only(top: height*0.6,left: width*0.6),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF3B8E25),
                elevation: 9.0,
                shadowColor: Color(0xFF3B8E25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(0),
                    topRight: Radius.circular(0),
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),

                  ),
                ),
              ),
              onPressed: () async{
                

                UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email.text,
                    password: password.text
                );

                if(user.user != null){

                  print(user.user!.uid);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>OnBoradingScreen())
                  );

                }
              },
              child: Text(
                'Lets Shop !',
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 17,
                ),
              ),
            ),
          ),

          ///Login button Fb
          Container(
            width: width*0.15,
            height: height*0.06,
            margin: EdgeInsets.only(top: height*0.7,left: width*0.85),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue.shade700,
                elevation: 9.0,
                shadowColor: Colors.blue.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(0),
                    topRight: Radius.circular(0),
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),

                  ),
                ),
              ),
              onPressed: (){

                phoneAuth();
              },
              child: Icon(
                Icons.facebook,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

