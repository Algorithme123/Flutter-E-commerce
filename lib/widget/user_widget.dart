import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go2shop/constante/global_colors.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
      leading:  FancyShimmerImage(
        height: size.width * 0.15,
        width : size.width * 0.15,
        errorWidget: const Icon(IconlyBold.danger,
          color: Colors.red,
          size: 28,
        ),
        imageUrl: 'https://i.ibb.co/vwB46Yq/shoes.png',
        boxFit: BoxFit.fill,

      ),
      title: Text(
        "Nom d'utilisateur",),
      subtitle: Text("Email@email.com"),
      trailing: Text(
        "User role",
        style: TextStyle(
          color: lightIconsColor,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
