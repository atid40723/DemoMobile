import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:project/map.dart';
import 'package:project/pageGPS.dart';
import 'package:project/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('10 ที่เที่ยวยอดฮิตในไทย ปี2023',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
        backgroundColor: Color.fromRGBO(84, 196, 134, 0.875),
      ), 
      drawer: DrawerA(),
      body: BodyLayout(),
    );
  }
}

////////  body  /////////////////////
class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  return Container(
    color: Color.fromRGBO(99, 169, 131, 0.301),
    child: ListView(
      padding: EdgeInsets.symmetric(
          vertical: 8.0), // เพิ่มระยะห่างด้านบนและด้านล่างของ ListView
      children: <Widget>[
        _buildListTile(context, "กรุงเทพมหานคร", '/Bangkok'),
        _buildListTile(context, "เกาะกระดาน", '/Koh_Kradan'),
        _buildListTile(context, "ชลบุรี", '/Chonburi'),
        _buildListTile(context, "หัวหิน ชะอำ", '/HuaHinCha_am'),
        _buildListTile(context, "กาญจนบุรี", '/Kanchanaburi'),
        _buildListTile(context, "พิษณุโลก", '/Phitsanulok'),
        _buildListTile(context, "ขอนแก่น", '/Khon_Kaen'),
        _buildListTile(context, "โคราช", '/Korat'),
        _buildListTile(context, "เลาขวัญ", '/Lao_Khwan'),
        _buildListTile(context, "บางกระเจ้า", '/Bang_Krachao'),
        SizedBox(height: 10), // เพิ่มระยะห่างระหว่างรายการ
      ],
    ),
  );
}

Widget _buildListTile(BuildContext context, String title, String routeName) {
  return Container(
    margin: EdgeInsets.symmetric(
        vertical: 4.0), // เพิ่มระยะห่างด้านบนและด้านล่างของ ListTile
    decoration: BoxDecoration(
      color: Colors.white, // กำหนดสีพื้นหลังของ ListTile
      borderRadius: BorderRadius.circular(8.0), // กำหนดขอบเขตของ ListTile
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1), // กำหนดสีและความโปร่งใสของเงา
          spreadRadius: 1, // ระยะการกระจายของเงา
          blurRadius: 4, // ความเบลอของเงา
          offset: Offset(0, 2), // การเยื้องของเงา
        ),
      ],
    ),
    child: ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
      ),
      onTap: () {
        Navigator.pushReplacementNamed(context, routeName);
      },
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: Color.fromARGB(90, 0, 0, 0), // สามารถเปลี่ยนสีได้ตามต้องการ
      ), // เพิ่มไอคอนด้านขวาของ ListTile
    ),
  );
}

////////  body  /////////////////////

class DrawerA extends StatefulWidget {
  const DrawerA({super.key});

  @override
  State<DrawerA> createState() => _DrawerA();
}

class _DrawerA extends State<DrawerA> {
  File? _avatar;
  File? _picture;
  
  bool isNotificationsEnabled = true; // ตัวแปรสถานะสำหรับการแจ้งเตือน

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromRGBO(84, 196, 189, 0.199),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('UserEx'),
              accountEmail: Text('UserEx@mail.com'),
              currentAccountPicture: CircleAvatar(
                child: _avatar != null
                    ? ClipOval(
                        child: Image.file(
                          _avatar!,
                          fit: BoxFit.cover,
                          width: 80,
                          height: 80,
                        ),
                      )
                    : FlutterLogo(size: 42.0),
                backgroundColor: Color.fromRGBO(255, 255, 255, 1),
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(84, 196, 134, 0.875),
              ),
            ),
// ListTile(
// leading: Icon(Icons.picture_in_picture_sharp),
// title: Text('รูป'),
// onTap: () {
// print('avatar :');print(_avatar); 
// print('picture :');print(_picture);
// },
// ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('ถ่ายรูป'),
              onTap: () {
                _avatar 
                == null
                    ? 
                    onChooseImage()
                            // ;_picture =_avatar;
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Scaffold(
                            appBar: AppBar(title: Text('Avatar')),
                            body: Image.file(_avatar!),
                          ),
                        ),
                      );
              },
            ),
            ListTile(
              leading: Icon(Icons.save),
              title: Text('บันทึก'),
              onTap: () {
                Navigator.pushNamed(context, '/user');
              },
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text('My GPS'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapsPage()),
                );
              },
            ),
            Divider(), // เพิ่มเส้นแบ่งระหว่างเมนู
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('ออกจากระบบ'),
              onTap: () {
                _showLogoutConfirmationDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ยืนยันการออกจากระบบ'),
          content: Text('คุณแน่ใจหรือไม่ที่ต้องการออกจากระบบ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // ปิดกล่องโต้ตอบ
              },
              child: Text('ยกเลิก'),
            ),
            TextButton(
              onPressed: () {
                // เพิ่มโค้ดเพื่อดำเนินการออกจากระบบ
                // เช่น เคลียร์ข้อมูลเซสชัน โลคเอ้าท์ หรืออื่นๆ
                Navigator.of(context).pop(); // ปิดกล่องโต้ตอบ
                Navigator.pushNamed(context, '/'); // เปิดหน้าล็อกอิน
              },
              child: Text('ยืนยัน'),
            ),
          ],
        );
      },
    );
  }

  Future<void> onChooseImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _avatar = File(pickedFile.path);
        // print('picture :');
        // _picture =_avatar;print(_picture);
      } else {
        print('No image selected.');
      }
    });
  }
}
