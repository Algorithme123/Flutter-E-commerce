import 'package:flutter/foundation.dart';

class CategoriesModel  with ChangeNotifier{
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  CategoriesModel({this.id, this.name, this.image, this.creationAt, this.updatedAt});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['creationAt'] = this.creationAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }


  static List<CategoriesModel> categoriefromSnapShot (List categorieSnapShot){

    return categorieSnapShot.map((data) {
      return CategoriesModel.fromJson(data);
    }).toList();
  }
}