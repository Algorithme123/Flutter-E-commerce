import 'package:flutter/material.dart';

class AppBarIcons extends StatefulWidget {

  const AppBarIcons({Key? key , required this.function, required this.icon})
      : super(key: key);

  final Function function;
  final IconData icon;

  @override
  State<StatefulWidget> createState() => _AppBarIconsState();
}

class _AppBarIconsState extends State<AppBarIcons> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),

      child: GestureDetector(
        onTap: (){
          widget.function();
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).cardColor,
          ),
          child: Padding(
            padding:  const EdgeInsets.all(6.0),
            child: Icon(widget.icon),
          ),
        ),
      ),

    );
  }
}
