import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.max,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formstate = GlobalKey<FormState>();
  String? email;
  String? password;
  final auth = FirebaseAuth.instance;
  String? message;
  String channelId = "1000";
  String channelName = "FLUTTER_NOTIFICATION_CHANNEL";
  String channelDescription = "FLUTTER_NOTIFICATION_CHANNEL_DETAIL";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color.fromRGBO(99, 169, 131, 0.301),
          padding: EdgeInsets.all(20.0),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formstate,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Login', // เปลี่ยนเป็น "Login" เพื่อแสดงข้อความ "Login" แทน
                  style: TextStyle(
                    fontSize: 30.0, // กำหนดขนาดข้อความ
                    fontWeight: FontWeight.bold, // กำหนดความหนาข้อความ
                  ),
                ),
                emailTextFormField(),
                SizedBox(height: 20.0), // เพิ่มระยะห่างระหว่างส่วนย่อย
                passwordTextFormField(),
                SizedBox(height: 20.0), // เพิ่มระยะห่างระหว่างส่วนย่อย
                loginButton(),
                SizedBox(height: 10.0), // เพิ่มระยะห่างระหว่างส่วนย่อย
                registerButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton registerButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('Goto Register page');
        Navigator.pushNamed(context, '/register');
      },
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          Size(300.0, 30.0), // ปรับความกว้างและความสูงของปุ่ม
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // ปรับมุมโค้งของปุ่ม
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.account_circle), // ไอคอน "Register" ที่ต้องการแสดง
          SizedBox(width: 5), // ระยะห่างระหว่างไอคอนกับข้อความ
          Text('Register new account'), // ข้อความที่ต้องการแสดงในปุ่ม
        ],
      ),
    );
  }

  ElevatedButton loginButton() {
    return ElevatedButton(
      onPressed: () async {
        if (_formstate.currentState!.validate()) {
          print('Valid Form');
          _formstate.currentState!.save();
          try {
            await auth
                .signInWithEmailAndPassword(email: email!, password: password!)
                .then((value) {
              if (value.user!.emailVerified) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Login Pass")));
                Navigator.pushNamed(context, '/homepage');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please verify email")));
                Navigator.pushNamed(context, '/homepage');
                sendNotification();
              }
            }).catchError((reason) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Login or Password Invalid")));
            });
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              print('No user found for that email.');
            } else if (e.code == 'wrong-password') {
              print('Wrong password provided for that user.');
            }
          }
        } else {
          print('Invalid Form');
        }
      },
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
            Size(300.0, 30.0)), // ปรับความกว้างและความสูงของปุ่ม
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // ปรับมุมโค้งของปุ่ม
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.login), // ไอคอน "Login" ที่คุณต้องการแสดง
          SizedBox(width: 5), // ระยะห่างระหว่างไอคอนกับข้อความ
          Text('Login'), // ข้อความ "Login" ที่ต้องการแสดงในปุ่ม
        ],
      ),
    );
  }

  bool _isObscure = true;

  IconButton passwordVisibilityIconButton() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isObscure = !_isObscure;
        });
      },
      icon: Icon(
        _isObscure ? Icons.visibility_off : Icons.visibility,
      ),
    );
  }

  TextFormField passwordTextFormField() {
    return TextFormField(
      onSaved: (value) {
        password = value!.trim();
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your password.';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters.';
        }
        return null;
      },
      obscureText: _isObscure,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Password',
        icon: Icon(Icons.lock),
        suffixIcon: passwordVisibilityIconButton(),
      ),
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      onSaved: (value) {
        email = value!.trim();
      },
      validator: (value) {
        if (!validateEmail(value!)) {
          return 'Please fill in E-mail field';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        labelText: 'E-mail',
        icon: Icon(Icons.email),
        hintText: 'x@x.com',
      ),
    );
  }

  bool validateEmail(String value) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    return (!regex.hasMatch(value)) ? false : true;
  }

  sendNotification() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      '10000',
      'FLUTTER_NOTIFICATION_CHANNEL',
      channelDescription: 'FLUTTER_NOTIFICATION_CHANNEL_DETAIL',
      importance: Importance.max,
      priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        111, 'ยินดีต้อนรับ', 'Log in สำเร็จ', platformChannelSpecifics,
        payload: 'message1');
  }
}
