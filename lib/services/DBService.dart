import 'package:miniproject1/logic/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class DBService {
  Future<bool> emailExists(String email) async {
    var response = await Supabase.instance.client
        .from('admins')
        .select('email')
        .eq('email', email)
        .execute();
    var resemail = response.data;
    print(resemail);
    if (resemail != null) {
      if (resemail.length > 0) {
        return resemail[0]["email"] == email;
      } else
        return false;
    } else
      return false;
  }

  Future<bool> restaurantExists(String id) async {
    var response = await Supabase.instance.client
        .from('restaurants')
        .select('id')
        .eq('id', id)
        .execute();
    var resid = response.data;
    print("rest" + resid.toString());
    if (resid != null) {
      if (resid.length > 0) {
        return resid[0]["id"] == id;
      } else
        return false;
    } else
      return false;
  }

  Future<bool> addAdmin(String email, String rest_id) async {
    var response = await Supabase.instance.client.from('admins').insert(
        {'id': Uuid().v4(), 'email': email, 'rest_id': rest_id}).execute();
    print(response.data);
    return response.data != null;
  }

  Future<bool> addRestraunt(String name, String rId) async {
    var response = await Supabase.instance.client
        .from('restaurants')
        .insert({"id": rId, 'name': name}).execute();

    return response.data != null;
  }

  Future<Admin> getUser(String email) async {
    dynamic response1 = await Supabase.instance.client
        .from('admins')
        .select("*")
        .eq("email", email)
        .execute();
    response1 = response1.data;
    String id = response1[0]["id"];
    String rest_id = response1[0]["rest_id"];
    dynamic response2 = await Supabase.instance.client
        .from("restaurants")
        .select("name")
        .eq("id", rest_id)
        .execute();
    response2 = response2.data;
    String rest_name = response2[0]["name"];
    Admin admin =
        Admin(id: id, email: email, restName: rest_name, restid: rest_id);

    return admin;
  }
}
