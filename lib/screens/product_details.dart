import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final titleStyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;


    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 18,
              ),
              BackButton(),
              Padding(
                  padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Categorie",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                                  flex: 3,
                            child: Text(
                              " Jolie Text",
                              textAlign: TextAlign.start,
                              style: titleStyle,
                            )
                        ),
                        Flexible(
                          flex: 1,
                            child: RichText(
                              text: const TextSpan(
                                text: '\$',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Color.fromRGBO(33, 150, 243, 1),
                                ),

                                children: <TextSpan>[
                                  TextSpan(
                                    text: '2000.0',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Color.fromRGBO(33, 150, 243, 1),
                                    ),
                                  ),
                                ]
                              ),
                            ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.4,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index){
                    return FancyShimmerImage(imageUrl: "",
                      width: double.infinity,
                      boxFit: BoxFit.fill,
                    );
                  },
                  autoplay: true,
                  itemCount: 3,
                  pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.white,
                      activeColor: Colors.red,
                    )
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                  padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description",style: titleStyle,),
                    SizedBox(height: 18,),
                    const Text("Je vous transmets donc mon CV ainsi que ma lettre de motivation. Vous y trouverez plus de détails sur mon parcours professionnel et mes réalisations.",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
