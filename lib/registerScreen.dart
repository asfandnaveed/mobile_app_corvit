import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app_corvit/SocialHomeScreen.dart';
import 'package:mobile_app_corvit/firebaseLogin.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: RegisterScreenStf(),
    );
  }
}


class RegisterScreenStf extends StatefulWidget {
  const RegisterScreenStf({Key? key}) : super(key: key);

  @override
  State<RegisterScreenStf> createState() => _RegisterScreenStfState();
}

class _RegisterScreenStfState extends State<RegisterScreenStf> {
  late double width;
  late double height;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();

  void register() async{
    String url = "https://prototype.analogenterprises.com/corvit/register.php";

    Map<String,dynamic> regData = Map<String,dynamic>();
    regData['email'] = email.text;
    regData['password'] = password.text;
    regData['name'] = name.text;
    regData['username'] = username.text;
    regData['phone'] = phone.text;

    var result = await http.post(Uri.parse(url),body: regData);


    print(result.body);

  }

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
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
              margin: EdgeInsets.only(top: height*0.62,left: width*0.58 ),
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
                Navigator.pop(context);
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
                        'LogIn',
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
                      'Sign Up',
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
                  /// username Input
                  Container(
                    margin: EdgeInsets.only(left: width*0.08,top: height*0.03),
                    child: TextField(
                      controller: username,
                      keyboardType: TextInputType.visiblePassword,
                      autofocus: false,
                      style: TextStyle(
                        fontFamily: 'poppins',
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter Username',
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

                  /// name Input
                  Container(
                    margin: EdgeInsets.only(left: width*0.08,top: height*0.03),
                    child: TextField(
                      controller: name,
                      keyboardType: TextInputType.visiblePassword,
                      autofocus: false,
                      style: TextStyle(
                        fontFamily: 'poppins',
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter Name',
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
                    width: width*0.55,
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
                    width: width*0.45,
                    color: Color(0xFFAcA9B2),
                  ),

                  /// phone Input
                  Container(
                    margin: EdgeInsets.only(left: width*0.08,top: height*0.03),
                    child: TextField(
                      controller: phone,
                      keyboardType: TextInputType.phone,
                      autofocus: false,
                      style: TextStyle(
                        fontFamily: 'poppins',
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter Phone Number',
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
                    width: width*0.55,
                    color: Color(0xFFAcA9B2),
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
                  DatabaseReference database = FirebaseDatabase.instance.ref();
                  // login();
                  UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email.text,
                      password: password.text
                  );

                  if(user.user != null){

                    print(user.user!.uid);

                    await database.child('Users').child(user.user!.uid).set({
                      "name": name.text,
                      "phone":phone.text,
                      "username":username.text
                    });

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
                onPressed: (){},
                child: Icon(
                  Icons.facebook,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

