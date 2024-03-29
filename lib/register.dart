import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/login.dart'; // อาจต้องเปลี่ยนที่ import ให้ถูกต้องตามโครงสร้างโปรเจกต์

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formstate = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // จัดให้อยู่กลางจอทั้งแนวนอนและแนวตั้ง
        child: Container(
          color: Color.fromRGBO(99, 169, 131, 0.301),
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formstate,
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // จัดให้อยู่ตรงกลางแนวตั้ง
              children: <Widget>[
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 24.0, // กำหนดขนาดข้อความ
                    fontWeight: FontWeight.bold, // กำหนดความหนาข้อความ
                  ),
                ),
                buildEmailField(),
                SizedBox(height: 20.0),
                buildPasswordField(),
                SizedBox(height: 20.0),
                buildRegisterButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ElevatedButton buildRegisterButton() {
  //   return ElevatedButton(
  //     onPressed: () async {
  //       print('Register new account');
  //       if (_formstate.currentState!.validate()) print(email.text);
  //       print(password.text);
  //       final user = await auth.createUserWithEmailAndPassword(
  //           email: email.text.trim(), password: password.text.trim());
  //       await user.user!.sendEmailVerification();
  //       Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(builder: (context) => const LoginPage()),
  //           ModalRoute.withName('/'));
  //     },
  //     style: ButtonStyle(
  //       fixedSize: MaterialStateProperty.all<Size>(
  //           Size(300.0, 30.0)), // ปรับความกว้างและความสูงของปุ่ม
  //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //         RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10.0), // ปรับมุมโค้งของปุ่ม
  //         ),
  //       ),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Icon(Icons.account_circle), // ไอคอน "Register" ที่เพิ่มมาใหม่
  //         SizedBox(width: 5), // ระยะห่างระหว่างไอคอนกับข้อความ
  //         Text(
  //           'Register',
  //           style: TextStyle(
  //             fontSize: 16.0, // กำหนดขนาดข้อความ
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  ElevatedButton buildRegisterButton() {
    return ElevatedButton(
      child: const Text('Register'),
      onPressed: () async {
        print('Register new account');
        if (_formstate.currentState!.validate()) print(email.text);
        print('password ');print(password.text);
        final user = await auth.createUserWithEmailAndPassword(
            email: email.text.trim(), password: password.text.trim());
        await user.user!.sendEmailVerification();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
            ModalRoute.withName('/'));
      },
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

  TextFormField buildPasswordField() {
    return TextFormField(
      // onSaved: (value) {
      //   password = value!.trim() as TextEditingController;
      // },
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return 'Please enter your password.';
      //   } else if (value.length < 8) {
      //     return 'Password must be at least 8 characters.';
      //   }
      //   return null;
      // },
            controller: password,
      validator: (value) {
        if (value!.length < 8) {
          return 'Please Enter more than 8 Character';
        } else {
          return null;
        }
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

  // TextFormField buildPasswordField() {
  //   return TextFormField(
  //     controller: password,
  //     validator: (value) {
  //       if (value!.length < 8) {
  //         return 'Please Enter more than 8 Character';
  //       } else {
  //         return null;
  //       }
  //     },
  //     obscureText: true,
  //     keyboardType: TextInputType.text,
  //     decoration: const InputDecoration(
  //       labelText: 'Password',
  //       icon: Icon(Icons.lock),
  //     ),
  //   );
  // }

  TextFormField buildEmailField() {
    return TextFormField(
      controller: email,
      validator: (value) {
        if (value!.isEmpty) {
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
}
