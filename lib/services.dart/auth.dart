import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Auth with ChangeNotifier {
  var _token;
  Dio dio = new Dio();

  String get token {
    return _token;
  }

  login(email, password) async {
    try {
      var response = await dio.post(
        'https://cryptobustle.herokuapp.com/authenticate',
        data: {"email": email, "password": password},
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      _token = response.data['token'];
      print('auth' + '$_token');
      notifyListeners();
      return response;
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15,
      );
    }
  }

  loginToken(email, password) async {
    var response = await dio.post(
      'https://cryptobustle.herokuapp.com/authenticate',
      data: {"email": email, "password": password},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    _token = response.data['token'];
    notifyListeners();
  }

  signUp(name, email, password) async {
    try {
      var response = await dio.post(
        'https://cryptobustle.herokuapp.com/adduser',
        data: {
          "name": name,
          "email": email,
          "password": password,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      loginToken(email, password);
      return response;
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15,
      );
    }
  }
}
