import 'dart:convert';

import 'package:bloc_dummy/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserApiRepository {

 Future<List<UserModel>> getUserData() async{
   try {
     var data = await http.get(Uri.parse("https://randomuser.me/api/?results=10"));
     return (json.decode(data.body)["results"] as List)
         .map((e) => UserModel.fromJson(e)).toList();
   }
   catch(e){
     throw Exception(e);
   }
  }


}