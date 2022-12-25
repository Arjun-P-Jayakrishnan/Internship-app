import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_do/models/user_model.dart';
import 'package:task_do/shared/login_credentials.dart';

class AuthService{

    final FirebaseAuth _auth=FirebaseAuth.instance;

    UserObj? _userFromFirebaseUser(User? user){
        return user!=null?UserObj(uid:user.uid):null;
    }



    //signIn Anonymously
    Future signInAnon() async{
        try {
            UserCredential result = await _auth.signInAnonymously();
            User user=result.user!;
            return _userFromFirebaseUser(user);
        }
        catch(e){
            print(e.toString());
            return null;
        }
    }

    //signout
    Future userSignOut() async{
        try{
            return _auth.signOut();
        }
        catch(e){
            print(e.toString());
            return null;
        }
    }
}