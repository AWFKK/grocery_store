import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:n_store/Helper/constants.dart';
import 'package:n_store/ModelClasses/ModelLogin.dart';

class Requestmanager {


  Future<UserLogin?> login( dynamic param) async {
    UserLogin userData = UserLogin();
    http.Response response = await _apiRequest(APIS.login, param);

    var responseData = json.decode(response.body);
    if (response.statusCode == 401) {
      //userData = UserLogin.fromJson(json.decode(response.body));
      print('401 ==> ${responseData['message']}');
      userData = UserLogin(
          error: true,
          //data: [""],
          message: responseData['message']
      );
      return userData;
    }
    else if(response.statusCode == 200){
      userData = UserLogin.fromJson(json.decode(response.body));
      print('200 ==> ${userData.message}');
      return userData;
    }else{
      print('Else 200 or 401 ==> ${responseData['message']}');
      userData = UserLogin(
          error: true,
          //data: [""],
          message: responseData['message']
      );
      return userData;
    }
  }


  //#####********8888
  //Common Method for request api
  //POST
  Future<http.Response> _apiRequest(String url, Map jsonMap) async {
    var body = jsonEncode(jsonMap);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      },
      body: body,
    );
    // print(response.body);
    return response;
  }

  //Post
  //For Receive Param with Token IN Header
  Future<http.Response> _apiRequestToken(String url, Map jsonMap, String token) async {
    var body = jsonEncode(jsonMap);
    print('Token Here ==> $token');
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        "Authorization":  "Bearer "+token,
      },
      body: body,
      //encoding: Encoding.getByName("utf-8"),
    );
    // print(response.body);
    return response;
  }


  //Without Parameters
  Future<http.Response> _apiRequestJson(String url, String token) async {
    //var body = jsonEncode(jsonMap);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        "Authorization":  "Bearer "+token,
      },
    );
    // print(response.body);
    return response;
  }
}

//GET
Future<http.Response> _apiRequestWithGet(String url) async {
  var response = await http.get(Uri.parse(url),);
  // print(response.body);
  return response;
}
