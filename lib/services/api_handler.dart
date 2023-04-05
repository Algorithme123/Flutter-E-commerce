import 'package:flutter/material.dart';
import 'package:go2shop/constante/api_consts.dart';
import 'package:http/http.dart' as http;

class APIHandler{

  Future<void> getAllProducts ()async {
    var uri = Uri.https(BASE_URL,"/api/v1/products",);

  var response = await  http.get(uri);
  }

}



