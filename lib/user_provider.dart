import 'package:flutter/foundation.dart';
class User {
  final String? name;
  final String? mobile;
  final String? save;
  const User({ this.name, this.mobile, this.save});
}

class UserProvider with ChangeNotifier {
  List<User> _nuser = [];
  //Map<String, dynamic> _user = {};

  List<User> get users {
    return _nuser;
  }

  // Map<String, dynamic> get users {
  //   return _user;
  // }

  addNewUser(User data) {
    _nuser.add(data);
    notifyListeners();
  }
}
