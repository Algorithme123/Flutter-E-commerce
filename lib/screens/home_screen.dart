import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go2shop/constante/global_colors.dart';
import 'package:go2shop/models/produit_model.dart';
import 'package:go2shop/screens/categories_screen.dart';
import 'package:go2shop/screens/feeds_screen.dart';
import 'package:go2shop/screens/users_screen.dart';
import 'package:go2shop/services/api_handler.dart';
import 'package:go2shop/widget/appbar_icons.dart';
import 'package:go2shop/widget/feeds_grid.dart';
import 'package:go2shop/widget/sale_widget.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;
  // List<ProduitModel> listProduit = [];

  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingController.dispose();
    super.dispose();
  }

  // @override
  // void didChangeDependencies() {
  //   getProduits();
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  // }
  //
  // Future<void> getProduits() async {
  //   listProduit = await APIHandler.getAllProducts();
  //   setState(() {
  //
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          title: Text("Home"),
          leading: Row(
            children: [
              Flexible(
                child: AppBarIcons(
                  function: () {
                    Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: CategoriesScreen(),
                        ));
                  },
                  icon: IconlyBold.category,
                ),
              ),
              // Flexible a dupliquer
            ],
          ),
          actions: [
            AppBarIcons(
              function: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: UserScreen(),
                  ),
                );
              },
              icon: IconlyBold.user3,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Recherche",
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                          width: 1,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                          width: 1,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    suffixIcon: Icon(
                      IconlyLight.search,
                      color: lightIconsColor,
                    )),
              ),
              const SizedBox(
                height: 18.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.25,
                        child: Swiper(
                          itemCount: 3,
                          itemBuilder: (ctx, index) {
                            return const SaleWidget();
                          },
                          pagination: const SwiperPagination(
                              alignment: Alignment.bottomCenter,
                              builder: DotSwiperPaginationBuilder(
                                  activeColor: Colors.red)),
                          /* ------------------------------------------
                    control:  SwiperControl(), // pour les fleches
                    -------------------------------------------------*/
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              "Latest Products",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                            const Spacer(),
                            AppBarIcons(
                                function: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FeedsScreen(),
                                      ));
                                },
                                icon: IconlyBold.arrowRight2)
                          ],
                        ),
                      ),
                      /*----------------------------------------------------------
                    Pour que lr scrooller on doit entourer GridView par Expanded
                   -----------------------------------------------*/
                  FutureBuilder<List<ProduitModel>>(
                      future: APIHandler.getAllProducts(),
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
                            child: Text("Pas de Produit"),
                            );
}
                        return FeedsGridWidget(listProduits: snapShot.data!);
                        }
                        ),
        ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
