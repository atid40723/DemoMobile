// ignore_for_file: avoid_print, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:project/db_helper.dart';

class EditUserPage extends StatefulWidget {
  final Map<String, dynamic>? us;
  const EditUserPage({Key? key, @required this.us}) : super(key: key);
  @override
  State createState() => _EditUserPageState();
  // receive data from the FirstScreen as a parameter
}

class _EditUserPageState extends State<EditUserPage> {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final id = TextEditingController(text: widget.us!['_id'].toString());
    final name = TextEditingController(text: widget.us!['name'].toString());
    final age = TextEditingController(text: widget.us!['age'].toString());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Update User'),
          backgroundColor: Color.fromRGBO(84, 196, 189, 0.875),
        ),
        body: Container(
          color: Color.fromRGBO(84, 196, 189, 0.199),
          child: Form(
            key: _form,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  controller: name,
                  //   initialValue: widget.us['name'],
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    icon: Icon(Icons.people),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Please fill in name' : null,
                ),
                TextFormField(
                    controller: age,
                    //  initialValue: widget.us['age'].toString(),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Age',
                      icon: Icon(Icons.list),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please fill in age';
                      } else {
                        int age = int.parse(value);
                        if (age < 0) {
                          return 'Please fill in age';
                        } else {
                          return null;
                        }
                      }
                    }),
                ElevatedButton(
                    child: const Text('Save'),
                    onPressed: () {
                      if (_form.currentState!.validate()) {
                        print('save button press');

                        Map<String, dynamic> row = {
                          DatabaseHelper.columnId: int.parse(id.text),
                          DatabaseHelper.columnName: name.text,
                          DatabaseHelper.columnAge: int.parse(age.text),
                        };
                        final dbHelper = DatabaseHelper.instance;
                        final rowsAffected = dbHelper.update(row);
                        print('updated $rowsAffected row(s)');
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please validate value'),
                          ),
                        );
                      }
                    })
              ],
            ),
          ),
        ));
  }
}
