import 'package:flutter/material.dart';
import 'package:go2shop/widget/user_widget.dart';


class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Utilisateurs"),

      ),

      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx,index){
          return const UserWidget();
        },
      ),

    );
  }
}
