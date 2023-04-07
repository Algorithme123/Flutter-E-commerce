import 'package:flutter/material.dart';
import 'package:go2shop/models/category_model.dart';
import 'package:go2shop/services/api_handler.dart';
import 'package:go2shop/widget/category_widget.dart';
import 'package:provider/provider.dart';

import '../widget/feeds_grid.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),),

      body: FutureBuilder<List<CategoriesModel>>(
          future: APIHandler.getAllCategories(),
          builder: (context,snapShot){
            if(snapShot.connectionState == ConnectionState){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(snapShot.hasError){

              return  Center(
                child: Text("Erreur  ${snapShot.error}"),
              );}

            else if(snapShot.data == null){
              return  const Center(
                child: Text("Pas de Categorie"),
              );
            }
            return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                    childAspectRatio: 1.2),
                itemBuilder: (ctx, index)
                {
                  return ChangeNotifierProvider.value(
                      value: snapShot.data![index],
                      child: CategoryWidget()
                  );
                }
                );
          }
      ),


    );
  }
}
