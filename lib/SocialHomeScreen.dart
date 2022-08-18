import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loading_indicator/loading_indicator.dart';

class OnBoradingScreen extends StatelessWidget {
  const OnBoradingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnBoradingScreenSTF();
  }
}

class OnBoradingScreenSTF extends StatefulWidget {
  const OnBoradingScreenSTF({Key? key}) : super(key: key);

  @override
  State<OnBoradingScreenSTF> createState() => _OnBoradingScreenSTFState();
}

class _OnBoradingScreenSTFState extends State<OnBoradingScreenSTF> {
  late double height;
  late double width;

  String name = "";

  final database = FirebaseDatabase.instance.ref();

  late DataSnapshot snapshot;




  @override
  initState() {
    super.initState();

    // getData();
    // sendPostData();
    // getPostsData();
  }

  void sendPostData() async {
    await database
        .child('Posts')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .push()
        .set({
      "image": "",
      "description": "Sample Post",
      "Likes": "56",
      "dateTime": "3454366234235",
      "comments": [
        {
          "uid": "uid",
          "dateTime": "3454366234235",
          "Likes": "3",
          "text": "Nice pic",
        },
        {
          "uid": "uid",
          "dateTime": "296649563895",
          "Likes": "45",
          "text": "Thanks",
        },
      ],
    });
  }

  Future getPostsData() async {
    snapshot = await database
        .child('Posts')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (snapshot.exists) {
      print(snapshot.value);
      print('-------- Function Print finish------');
    }

    return snapshot.value;
  }

  void getData() async {
    snapshot = await database
        .child('Users')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .get();

    Map<dynamic, dynamic> map = snapshot.value as Map<dynamic, dynamic>;

    if (snapshot.exists) {
      print(map['phone']);

      name = map['name'];

      setState(() {
        print(map['name']);
      });
    }
  }

  get bottomNavigationBar => null;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            top: height * 0.02,
            left: width * 0.05,
            right: width * 0.05,
          ),
          child: Column(
            children: [
              ///User Name from DB
              Container(
                child: Text(
                  'Hello ' + name,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              /// Top Row Title and Icons
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Title
                    Container(
                      child: Text(
                        'Piqobe',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    /// Setting icon
                    Container(
                      margin: EdgeInsets.only(
                        left: width * 0.3,
                      ),
                      child: Icon(Icons.settings),
                    ),

                    /// Notice Icon
                    Container(
                      child: Icon(Icons.notification_add),
                    ),
                  ],
                ),
              ),

              /// Stories section

              Container(
                margin: EdgeInsets.only(
                  top: height * 0.03,
                ),
                height: height * 0.2,
                width: width,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    /// S1
                    Container(
                      margin: EdgeInsets.only(
                        left: width * 0.02,
                        right: width * 0.02,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.1,
                            width: width * 0.2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/images/s4.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: height * 0.01,
                            ),
                            child: Text(
                              'You',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// S2
                    Container(
                      margin: EdgeInsets.only(
                        left: width * 0.02,
                        right: width * 0.02,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.1,
                            width: width * 0.2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/images/s1.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: height * 0.01,
                            ),
                            child: Text(
                              'Pieters',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// S3
                    Container(
                      margin: EdgeInsets.only(
                        left: width * 0.02,
                        right: width * 0.02,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.1,
                            width: width * 0.2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/images/s2.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: height * 0.01,
                            ),
                            child: Text(
                              'Lerone',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// S14
                    Container(
                      margin: EdgeInsets.only(
                        left: width * 0.02,
                        right: width * 0.02,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.1,
                            width: width * 0.2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/images/s3.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: height * 0.01,
                            ),
                            child: Text(
                              'Nataliya',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// Future Builder
              Container(
                height: height * 0.55,
                child: FutureBuilder(
                    future: getPostsData(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          width: width* 0.3,
                          child: const LoadingIndicator(
                              indicatorType: Indicator.ballPulse,

                              /// Required, The loading type of the widget
                              colors: [Colors.indigoAccent,Colors.green,Colors.orange],

                              /// Optional, The color collections
                              strokeWidth: 2,

                              /// Optional, The stroke of the line, only applicable to widget which contains line
                              backgroundColor: Colors.white,

                              /// Optional, Background of the widget
                              pathBackgroundColor: Colors.white

                            /// Optional, the stroke backgroundColor
                          ),
                        );
                      } else {

                        Map<dynamic,dynamic> map = snapshot.data as Map<dynamic,dynamic>;


                        List<String> likes = [];
                        List<String> image = [];
                        int count=0;
                        map.forEach((key,value){
                          print(value['description']);
                          count++;

                          likes.add(value['Likes']);
                          image.add(value['image']);
                        });

                        return Container (
                            height: height * 0.55,
                            child: ListView.builder(
                              itemCount: count,
                              itemBuilder:(BuildContext context,index){
                                return Container(
                                  height: height * 0.6,
                                  width: width * 0.8,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF0F1F4),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Card(
                                    margin: EdgeInsets.all(15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    elevation: 8.0,
                                    child: Column(
                                      children: [
                                        /// Profile Row
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              /// Profile Pic
                                              Container(
                                                  margin: EdgeInsets.all(5),
                                                  height: height * 0.1,
                                                  width: width * 0.2,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color(0xFFFAA976),
                                                          width: 1),
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      )),
                                                  child: Container(
                                                    margin: EdgeInsets.all(3.5),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(10),
                                                      child: Image.asset(
                                                        'assets/images/p1.png',
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  )),

                                              /// User Name
                                              Column(
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      'Ehsan Allahi',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                      right: width * 0.1,
                                                    ),
                                                    child: Text(
                                                      '30 Sec Ago',
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w200,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  right: width * 0.05,
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 1,
                                                    color: Colors.black,
                                                  ),
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                ),
                                                child: Icon(Icons.more_horiz_outlined),
                                              ),
                                            ],
                                          ),
                                        ),

                                        /// Video Section
                                        Container(
                                          margin: EdgeInsets.all(15),
                                          child: ClipRRect(
                                            child: Image.network(image[index]),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),

                                        /// Icons Section
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left: width * 0.05,
                                                ),
                                                child: Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left: width * 0.05,
                                                ),
                                                child: Icon(Icons.message_outlined),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left: width * 0.05,
                                                ),
                                                child: Icon(Icons.forward_5_outlined),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left: width * 0.2,
                                                ),
                                                child: Icon(Icons.save_alt_outlined),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            right: width * 0.15,
                                            top: height * 0.015,
                                          ),
                                          child: Text(
                                            '${likes[index]} Liked By Ravees ',
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } ,



                            ),
                          );
                      }
                    }),
              ),

              /// Bottom Navigation
              Container(
                margin: EdgeInsets.only(top: height * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Icon(
                        Icons.mail,
                      ),
                    ),
                    Container(
                      child: Icon(Icons.messenger_outline),
                    ),
                    Container(
                      child: Icon(Icons.add_circle),
                    ),
                    Container(
                      child: Icon(Icons.search),
                    ),
                    Container(
                      child: Icon(Icons.person_outline),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
