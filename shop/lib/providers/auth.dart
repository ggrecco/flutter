import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/exception/auth_exception.dart';

class Auth with ChangeNotifier {
      // https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=[API_KEY]



  Future<void> _authenticate(String email, String password, String urlSegment) async {
    final url =
      'https://identitytoolkit.googleapis.com/v1/accounts:${urlSegment}?key=AIzaSyAssHH1IKsQx06-LLh33TC0W7hGTY6iyfM';
    
    final response = await http.post(
      url,
      body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );

    final responseBody = json.decode(response.body);
    if(responseBody['error'] != null){
      throw AuthException(responseBody['error']['message']);
    }
    
    return Future.value();
  }    

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }

}
