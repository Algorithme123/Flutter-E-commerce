import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go2shop/constante/global_colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                imageUrl: 'https://i.ibb.co/vwB46Yq/shoes.png',
                // imageUrl: "https://cdn.shopify.com/s/files/1/1183/2814/products/30f894c0_1024x1024.jpeg?v=1571064294",
                boxFit: BoxFit.fill,

              ),
            ),
             Align(
               child: Text("Nom de la categorie",textAlign: TextAlign.center,
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
