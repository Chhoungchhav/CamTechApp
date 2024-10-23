import 'package:flutter/material.dart';
import '../widgets/camtech_template.dart';
import 'aboutus_page.dart';
import 'faculties_page.dart';
import 'home_page.dart';
// import 'package:overlay_support/overlay_support.dart';
// import '../notification_badge.dart';
// import '../push_notification.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_core/firebase_core.dart';
// import '../../firebase_options.dart';
// import '../../generated/l10n.dart';
// import 'study_page.dart';

class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  // late int _totalNotifications;
  // late final FirebaseMessaging _messaging;
  // PushNotification? _notificationInfo;
  Widget pages = HomePage();
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Disable Firebase and notifications
    // requestAndRegisterNotification();
    // _totalNotifications = 0;
  }

  // Disable Firebase messaging background handler
  // Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //   print("Handle background: ${message.messageId}");
  // }

  // Disable requestAndRegisterNotification function
  // void requestAndRegisterNotification() async {
  //   //1. Initialize the firebase app
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await Firebase.initializeApp(
  //       options: DefaultFirebaseOptions.currentPlatform);

  //   _messaging = FirebaseMessaging.instance;
  //   await _messaging.requestPermission();
  //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  //   NotificationSettings settings = await _messaging.requestPermission(
  //       alert: true, badge: true, provisional: false, sound: true);

  //   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //     String? token;
  //     await _messaging.getToken().then((fmtoken) {
  //       token = fmtoken;
  //       print("FMC:${fmtoken}");
  //     });
  //     print("THe token is: ${token}");
  //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //       PushNotification notifications = PushNotification(
  //           title: message.notification?.title,
  //           body: message.notification?.body);
  //       setState(() {
  //         _notificationInfo = notifications;
  //         _totalNotifications++;
  //       });
  //       if (_notificationInfo != null) {
  //         showSimpleNotification(Text(_notificationInfo!.title!),
  //             leading: NotificationBadge(
  //               totalNotification: _totalNotifications,
  //             ),
  //             subtitle: Text(_notificationInfo!.body!),
  //             background: Colors.cyan.shade700,
  //             duration: Duration(seconds: 2));
  //       }
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CamtechTemplate(
        child: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Color(0xFF003665),
          onTap: (val) {
            setState(() {
              _currentIndex = val;
              if (val == 0) {
                pages = HomePage();
              } else if (val == 1) {
                pages = FacultiesPage();
              } else if (val == 2) {
                pages = AboutUsPage();
              }
            });
          },
          currentIndex: _currentIndex,
          items: [
            new BottomNavigationBarItem(
                icon: new Icon(Icons.home_filled, size: 28), label: "Home"),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.school_outlined, size: 28),
                label: "Faculties"),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.personal_injury_outlined, size: 28),
                label: "About Us"),
          ]),
    );
  }
}
