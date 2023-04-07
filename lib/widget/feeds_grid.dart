
import 'package:flutter/material.dart';
import 'package:go2shop/models/produit_model.dart';
import 'package:go2shop/widget/feeds_widget.dart';
import 'package:provider/provider.dart';
class FeedsGridWidget extends StatelessWidget {
   FeedsGridWidget({Key? key, required this.listProduits}) : super(key: key);

 final  List<ProduitModel> listProduits;


  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listProduits.length ,
      gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0.0,
      mainAxisSpacing: 0.0,
      childAspectRatio: 0.6),
      itemBuilder: (ctx,index){
        return ChangeNotifierProvider.value(
          value: listProduits[index ],
          child: const FeedsWidget(),

        );
      },
    );
  }
}
