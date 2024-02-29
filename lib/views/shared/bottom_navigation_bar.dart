import 'package:flutter/material.dart';

class BottomNavBar_Widget extends StatelessWidget {
  BottomNavBar_Widget({Key? key, this.onTap, this.icon});

  final IconData? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 46,
        child: Icon(icon,color: Colors.white,size: 40,),
      ),
    );
  }
}
