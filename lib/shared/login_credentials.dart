import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_do/services/auth.dart';

import '../models/user_model.dart';


















class LoginCredentials{

  final AuthService _auth=AuthService();

  static  String LoginId="";

  resetUser() async{

    dynamic result=await _auth.signInAnon();
    print(result.uid);

    SharedPreferences _prefs=await SharedPreferences.getInstance();
    _prefs.setString('userAnon', result.uid);
    LoginId=result.uid;

  }

  userLoginId() async{

    SharedPreferences _prefs=await SharedPreferences.getInstance();
    print(_prefs.getString('userAnon'));

    if(_prefs.getString('userAnon')==null) {
    }
    LoginId=_prefs.getString('userAnon')!;

    return UserObj(uid:LoginId);
  }

}
