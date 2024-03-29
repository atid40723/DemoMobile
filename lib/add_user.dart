import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:project/db_helper.dart';
import 'package:project/login.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  AddUserPageState createState() => AddUserPageState();
}

class AddUserPageState extends State<AddUserPage> {
  final _form = GlobalKey<FormState>();
  final _id = TextEditingController();
  final _name = TextEditingController();
  final _age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add User'),
          backgroundColor: Color.fromRGBO(84, 196, 134, 0.875),
        ),
        body: Container(
          color: Color.fromRGBO(84, 196, 134, 0.199),
          child: Form(
            key: _form,
            child: ListView(
              children: <Widget>[
                //    buildIdField(),
                buildNameField(),
                buildAgeField(),
                buildSaveButton()
              ],
            ),
          ),
        ));
  }

  ElevatedButton buildSaveButton() {
    return ElevatedButton(
        child: const Text('Save'),
        onPressed: () {
          if (_form.currentState!.validate()) {
            print('save button press');
            Map<String, dynamic> row = {
              DatabaseHelper.columnName: _name.text,
              DatabaseHelper.columnAge: int.parse(_age.text),
            };
            final dbHelper = DatabaseHelper.instance;
            final id = dbHelper.insert(row);

            print('inserted row id: $id');

            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please validate value'),
              ),
            );
          }
        });
  }

  TextFormField buildIdField() {
    return TextFormField(
      controller: _id,
      decoration: const InputDecoration(
        labelText: 'id',
        icon: Icon(Icons.book),
      ),
      validator: (value) => value!.isEmpty ? 'Please fill in id' : null,
    );
  }

  TextFormField buildNameField() {
    return TextFormField(
      controller: _name,
      decoration: const InputDecoration(
        labelText: 'name',
        icon: Icon(Icons.people),
      ),
      validator: (value) => value!.isEmpty ? 'Please fill in name' : null,
    );
  }

  TextFormField buildAgeField() {
    return TextFormField(
        controller: _age,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'age',
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
        });
  }
}
