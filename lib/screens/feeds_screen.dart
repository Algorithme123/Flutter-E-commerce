import 'package:flutter/material.dart';
import 'package:go2shop/models/produit_model.dart';
import 'package:go2shop/services/api_handler.dart';
import 'package:go2shop/widget/feeds_widget.dart';
import 'package:provider/provider.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  List<ProduitModel> produitsList = [];
  @override
  void didChangeDependencies() {
    getProduits();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  Future<void> getProduits() async {
    produitsList = await APIHandler.getAllProducts();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: Text("Tous les produits"),

      ),
      body: produitsList.isEmpty
        ? const Center(
        child:  CircularProgressIndicator(),
      ) :
      GridView.builder(
          // shrinkWrap: true,
           // physics: const ScrollableScrollPhysics(),
          itemCount: produitsList.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
              childAspectRatio: 0.7),
          itemBuilder: (ctx, index) {
            return ChangeNotifierProvider.value(
              value : produitsList[index],
              child : FeedsWidget(

              ),
            );
          }),
    );
  }
}
