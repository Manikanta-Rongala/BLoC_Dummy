import 'dart:convert';

class UserModel{
  String email;
   String mobileNumber;



  UserModel({required this.email,required this.mobileNumber});

//factory model

 factory UserModel.fromJson(Map map){
   return UserModel(
      email: map["email"],
     mobileNumber: map["phone"],

   );
 }

}