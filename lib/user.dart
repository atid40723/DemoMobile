import 'package:flutter/material.dart';
import 'package:project/db_helper.dart';
import 'package:project/update_user.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends State<UserPage> {
  List<Map<String, dynamic>> us = [];

  final dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        backgroundColor: Color.fromRGBO(84, 196, 134, 0.875),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              await Navigator.pushNamed(context, '/adduser');
              _query();
            },
          ),
        ],
      ),
      body: _myListView(context),
    );
  }

  Future<void> _query() async {
    final allRows = await dbHelper.queryAllRows();
    setState(() {
      us = allRows;
    });
  }

  void _delete(Map<String, dynamic> us) async {
    var id = us['_id'];
    final rowsDeleted = await dbHelper.delete(id);
    print('deleted $rowsDeleted row(s): row $id');
    _query();
  }

  Widget _myListView(BuildContext context) {
    _query();
    return Container(
      color: Color.fromRGBO(99, 169, 131, 0.301),
      child: ListView.builder(
        itemCount: us.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3, // เพิ่มเงาให้กับ Card
            margin: EdgeInsets.symmetric(
                horizontal: 16, vertical: 8), // เพิ่มระยะห่างของ Card
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8), // เพิ่มระยะห่างของเนื้อหาใน ListTile
              title: Text(
                'No: ${us[index]['_id']} Name: ${us[index]['name']}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Age: ${us[index]['age']}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete_rounded),
                onPressed: () {
                  _delete(us[index]);
                },
              ),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditUserPage(
                      us: us[index],
                    ),
                  ),
                );
                _query();
              },
            ),
          );
        },
      ),
    );
  }
}
