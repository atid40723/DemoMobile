import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/Bangkok.dart';
import 'package:project/Koh_Kradan.dart';
import 'package:project/Chonburi.dart';
import 'package:project/HuaHinCha_am.dart';
import 'package:project/Kanchanaburi.dart';
import 'package:project/Phitsanulok.dart';
import 'package:project/Khon_Kaen.dart';
import 'package:project/Korat.dart';
import 'package:project/Lao_Khwan.dart';
import 'package:project/Bang_Krachao.dart';
import 'package:project/add_user.dart';
import 'package:project/login.dart';
import 'package:project/home.dart';
import 'package:project/maintwo.dart';
import 'package:project/pageGPS.dart';
import 'package:project/register.dart';
import 'package:project/user.dart';
//https://www.pptvhd36.com/travel/thailand/212646

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: buildMaterialApp(),
    );
  }
}

MaterialApp buildMaterialApp() {
  return MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.teal,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => LoginPage(),
      // b@b.com
      // 12345678
      '/register': (context) => RegisterPage(),
      '/homepage': (context) => Homepage(),
      '/Bangkok': (context) => const Bangkok(),
      '/Koh_Kradan': (context) => const Koh_Kradan(),
      '/Chonburi': (context) => const Chonburi(),
      '/HuaHinCha_am': (context) => const HuaHinCha_am(),
      '/Kanchanaburi': (context) => const Kanchanaburi(),
      '/Phitsanulok': (context) => const Phitsanulok(),
      '/Khon_Kaen': (context) => const Khon_Kaen(),
      '/Korat': (context) => const Korat(),
      '/Lao_Khwan': (context) => const Lao_Khwan(),
      '/Bang_Krachao': (context) => const Bang_Krachao(),
      '/adduser': (context) => const AddUserPage(),
      '/user': (context) => const UserPage(),
      '/mtwo': (context) => const MyApptwo(),
      '/pageGPS': (context) => MyGPS(),
    },
  );
}
