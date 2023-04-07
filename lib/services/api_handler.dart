import 'dart:convert';

import 'package:go2shop/constante/api_consts.dart';
import 'package:go2shop/models/category_model.dart';
import 'package:go2shop/models/produit_model.dart';
import 'package:http/http.dart' as http;

 class APIHandler{

   static Future<List<dynamic>> getData( {required String target})async {
     var uri = Uri.https(BASE_URL,"/api/v1/$target",);

     var response = await  http.get(uri);
     var data =jsonDecode(response.body);

     List tempList =[];
     for(var p in data){
       tempList.add(p);
     }
     return tempList;

   }



  static Future<List<ProduitModel>> getAllProducts ()async {

     List produitList = await getData(target: "products");

return ProduitModel.produitfromSnapShot(produitList);
  }



  static Future<List<CategoriesModel>> getAllCategories ()async {

    List categorieList = await getData(target: "categories");

    return CategoriesModel.categoriefromSnapShot(categorieList);
  }

}



