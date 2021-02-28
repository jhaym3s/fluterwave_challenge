import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class Auth with ChangeNotifier{
  String _token, _userId;
  DateTime _expiryDate;
  //Auth({this._expiryDate,});

  Future<void> signUp(String email,password)async{
    final url = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCMP5c87yDobuspIsKYqjNu7vIRYkpzEKo";
    final response = await http.post(url, body: json.encode({
      "email": email,
      "password": password,
      "returnSecureToken": true,
    }));
    print(json.decode(response.body));
  }
}