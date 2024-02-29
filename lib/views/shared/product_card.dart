import 'package:ecommmeranceeeee/views/shared/app_style.dart';
import 'package:flutter/material.dart';

class Product_Card extends StatefulWidget {
  const Product_Card({
    Key? key,
    required this.name,
    required this.image,
    required this.id,
    required this.category,
    required this.price,
    required this.items_left,
    required this.text,
  }) : super(key: key);

  final String name;
  final String image;
  final String id;
  final String category;
  final String price;
  final String items_left;
  final String text;

  @override
  State<Product_Card> createState() => _Product_CardState();
}

class _Product_CardState extends State<Product_Card> {
  bool isFavorite = false; // Track favorite status

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 5, bottom: 25,top: 5),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(.1),
                spreadRadius: 1,
                blurRadius: 0.8,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(widget.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 5,
                      child: GestureDetector(
                        onTap: () {
                          // Toggle the favorite status
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        child: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: Colors.red,
                          size: 25,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 14,
                      top: 5,
                      child: GestureDetector(
                        onTap: null,
                        child: Text(
                          widget.items_left,
                          style:
                          appStyle(18, Colors.white, FontWeight.bold),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 25,
                      top: 5,
                      child: GestureDetector(
                        onTap: null,
                        child: Text(
                          widget.text,
                          style:
                          appStyle(16, Colors.grey, FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7,),
                Padding(
                  padding: const EdgeInsets.only(left: 7.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        overflow: TextOverflow.ellipsis,
                        style: appStyleHt(
                            16, Colors.black, FontWeight.bold, 1.1),
                      ),
                      Text(
                        widget.category,
                        style: appStyleHt(
                            16, Colors.grey, FontWeight.bold, 1.5),
                      ),
                    ],
                  ),
                ),
                //SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.price,
                        style:
                        appStyle(16, Colors.black, FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Row(
                          children: [
                            Text(
                              "20%Off",
                              style: appStyle(
                                  20, Colors.red, FontWeight.bold),
                            ),

                            SizedBox(width: 5,),



                            // CircleAvatar(
                            //   radius: 5,
                            //   backgroundColor: Colors.green,
                            // ),
                            // CircleAvatar(
                            //   radius: 5,
                            //   backgroundColor: Colors.grey,
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
