import 'package:flutter/material.dart';
import 'package:project/Bang_Krachao.dart';
import 'package:project/Bangkok.dart';
import 'package:project/Chonburi.dart';
import 'package:project/HuaHinCha_am.dart';
import 'package:project/Kanchanaburi.dart';
import 'package:project/Khon_Kaen.dart';
import 'package:project/Koh_Kradan.dart';
import 'package:project/Korat.dart';
import 'package:project/Lao_Khwan.dart';
import 'package:project/Phitsanulok.dart';
import 'package:project/add_user.dart';
import 'package:project/user.dart';
import 'package:project/home.dart';

class MyApptwo extends StatelessWidget {
  const MyApptwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => const UserPage(),
            '/user': (context) => const UserPage(),
            '/adduser': (context) => const AddUserPage(),
            '/mtwo': (context) => const MyApptwo(),
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
          }
    );
  }
}
