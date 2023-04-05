import 'package:flutter/material.dart';
import 'package:go2shop/widget/feeds_widget.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: Text("Tous les produits"),

      ),
      body: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
              childAspectRatio: 0.7),
          itemBuilder: (ctx, index) {
            return FeedsWidget();
          }),
    );
  }
}
