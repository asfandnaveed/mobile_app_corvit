
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_corvit/SocialHomeScreen.dart';
import 'package:mobile_app_corvit/firebaseLogin.dart';
import 'package:mobile_app_corvit/foodHomeScreen.dart';
import 'package:mobile_app_corvit/foodOnboardingScreen.dart';
import 'package:mobile_app_corvit/geoLocator.dart';
import 'package:mobile_app_corvit/homeScreen.dart';
import 'package:mobile_app_corvit/medicalHomeScrreen.dart';
import 'package:mobile_app_corvit/newWidtgets.dart';
import 'package:mobile_app_corvit/realtime_firbase.dart';
import 'package:mobile_app_corvit/registerScreen.dart';
import 'package:mobile_app_corvit/sampleScreen.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:mobile_app_corvit/shoppingCart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_app_corvit/drawer.dart';

import 'package:awesome_notifications/awesome_notifications.dart';

import 'Push_notification.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    await setupFlutterNotifications();
  }
  AwesomeNotifications().initialize(
    // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupkey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true
  );
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context)=>GeoLocator(),
      '/LoginScreen': (context) =>  LoginScreen(),
      '/SignUp': (context) => RegisterScreen(),
      '/Products':(context)=> Drawer1(),
      '/Products/detail':(context)=>OnBoradingScreen(),
      '/Products/detail/cart':(context)=>FoodHomeScreen(),
    },
  ));
}


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: (){
            AwesomeNotifications().isNotificationAllowed().then((isAllowed) async {
              if (!isAllowed) {
                // This is just a basic example. For real apps, you must show some
                // friendly dialog box before call the request method.
                // This is very important to not harm the user experience
                AwesomeNotifications().requestPermissionToSendNotifications();
              }else{
                String localTimeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();

                AwesomeNotifications().createNotification(
                    content: NotificationContent(
                        id: 10,
                        channelKey: 'basic_channel',
                        title: 'Hello Corvit'+ Emojis.emotion_purple_heart + Emojis.smile_angry_face + Emojis.emotion_red_heart,
                        body: 'Its been a long time you last visited',
                      notificationLayout: NotificationLayout.BigPicture,
                      bigPicture: 'asset://assets/images/perfume.png',

                    ),
                    schedule: NotificationCalendar(
                        second: 5,
                        timeZone: localTimeZone,
                        preciseAlarm: true,
                )

                );
              }
            });
          },
          child: Text('Show Notification'),
        ),
      ),
    );
  }
}






