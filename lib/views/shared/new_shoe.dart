import 'package:flutter/material.dart';
class New_Shoe extends StatelessWidget {
  const New_Shoe({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      //child:Image(image: NetworkImage( imageUrl),fit: BoxFit.contain,),
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage( imageUrl),fit: BoxFit.contain,alignment: Alignment.center),
        borderRadius:
        BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: .1,
            blurRadius: 2.0,
            offset: Offset(0,1 ),
          ),
        ],
        color: Colors.white,
      ),
      height: MediaQuery.of(context)
          .size
          .height *
          0.10,
      width: MediaQuery.of(context)
          .size
          .width *
          0.20,
    );
  }
}
