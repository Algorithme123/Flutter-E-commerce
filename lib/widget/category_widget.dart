import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go2shop/constante/global_colors.dart';
import 'package:go2shop/models/category_model.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final CategoriesModel categoriesModelProvider = Provider.of<CategoriesModel>(context);


    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                height:   size.height * 0.45,
                width : size.width * 0.45,
                errorWidget: const Icon(IconlyBold.danger,
                  color: Colors.red,
                  size: 28,
                ),
                imageUrl: categoriesModelProvider.image.toString(),
                // imageUrl: "https://cdn.shopify.com/s/files/1/1183/2814/products/30f894c0_1024x1024.jpeg?v=1571064294",
                boxFit: BoxFit.fill,

              ),
            ),
             Align(
               child: Text(
                 categoriesModelProvider.name.toString(),
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 24,
                   fontWeight: FontWeight.bold,
                   backgroundColor: lighCardColor.withOpacity(0.5),
                 ),),
             )
          ],
        ),
    );
  }
}
