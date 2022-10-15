import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  Future<bool> signInWithEmail(String email, String password) async {
    try {
      final response = await Supabase.instance.client.auth
          .signIn(email: email, password: password);
      if (response.error != null) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> SignUp(String email, String password) async {
    try {
      final response = await Supabase.instance.client.auth
          .signIn(email: email, password: password);
      if (response.error != null) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> SignOut() async {
    try {
      final response = await Supabase.instance.client.auth.signOut();
      if (response.error != null) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> checkSignin() async {
    try {
      final response = await Supabase.instance.client.auth.currentUser;
      return response != null;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
