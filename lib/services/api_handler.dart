import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go2shop/constante/api_consts.dart';
import 'package:go2shop/models/produit_model.dart';
import 'package:http/http.dart' as http;

 class APIHandler{

  static Future<List<ProduitModel>> getAllProducts ()async {
    var uri = Uri.https(BASE_URL,"/api/v1/products",);

  var response = await  http.get(uri);
  var data =jsonDecode(response.body);

  List produitList =[];
  for(var produit in data){
    produitList.add(produit);
  }
return ProduitModel.produitfromSnapShot(produitList);
  }



}



