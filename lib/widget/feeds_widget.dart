import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go2shop/constante/global_colors.dart';
import 'package:go2shop/models/produit_model.dart';
import 'package:go2shop/screens/product_details.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class FeedsWidget extends StatelessWidget {
  const FeedsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ProduitModel produitModelProvider = Provider.of<ProduitModel>(context);

    Size size = MediaQuery.of(context).size;
    return  Padding(
        padding: EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.circular(8.0),
          color: Theme.of(context).cardColor,
          child: InkWell(
            borderRadius: BorderRadius.circular(8.0),
            onTap: (){
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: ProductDetails(),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 5, right : 5, top :8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: RichText(
                            text: TextSpan(
                              text: "\$",
                              style: const TextStyle(
                                color: Color.fromRGBO(33, 150, 243, 1)
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "${produitModelProvider.price}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: lightTextColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ),
                      Icon(IconlyBold.heart),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FancyShimmerImage(
                    height: size.height * 0.2,
                    width : double.infinity,
                    errorWidget: const Icon(IconlyBold.danger,
                    color: Colors.red,
                    size: 28,
                    ),
                    imageUrl: produitModelProvider.images![0],
                    boxFit: BoxFit.fill,

                  ),
                ),
                const SizedBox(height: 10 ,),
                 Padding(
                    padding: EdgeInsets.all(8.0),
                  child: Text(
                    produitModelProvider.title.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                // SizedBox(
                //   height: size.height * 0.1,
                // )
              ],
            ),
          ),
        ),
    );
  }
}
