import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go2shop/widget/appbar_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child:  Scaffold(
        appBar: AppBar(
          title:  Text("Home"),
          leading: AppBarIcons(
            function: (){},
            icon: IconlyBold.user3,
          ),
        ),
        body: Center(
          child: Text("Bien venue"),
        ),
      ),
    );
  }
}
