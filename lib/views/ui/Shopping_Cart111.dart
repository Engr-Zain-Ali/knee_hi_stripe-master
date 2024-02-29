import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/men_shoe_model/men_shoe_model.dart';
import '../../services/helper.dart';
import '../shared/app_style.dart';
import '../shared/product_provider.dart';

class Shopping_Cart1 extends StatefulWidget {
  final String id;
  final String category;
  final String imageUrl;
  final String name;
  final String price;

  const Shopping_Cart1({
    Key? key,
    required this.id,
    required this.category,
    required this.imageUrl, required this.name, required this.price,
  }) : super(key: key);

  @override
  State<Shopping_Cart1> createState() => _Shopping_Cart1State();
}

class _Shopping_Cart1State extends State<Shopping_Cart1> {
  late Future<Welcome> _sneaker;
  void getShoes() {
    if (widget.category == "Category.RUNNING"||widget.category == "Category.FORMAL"||widget.category == "Category.FOOTBALL"||widget.category == "Category.CASUAL") {
      _sneaker = Helper().getMaleSneakersById(widget.id);
    } else if (widget.category == "Category.RUNNING"||widget.category == "Category.FORMAL"||widget.category == "Category.FOOTBALL"||widget.category == "Category.CASUAL") {
      _sneaker = Helper().getFemaleSneakersById(widget.id);
    }  else if (widget.category == "Category.RUNNING"||widget.category == "Category.FORMAL"||widget.category == "Category.FOOTBALL"||widget.category == "Category.CASUAL")  {
      _sneaker = Helper().getKidsSneakersById(widget.id);
    }
  }
  int quantity = 1;
  @override
  void initState() {
    super.initState();
    getShoes();
  }

  void updateQuantity(int newQuantity) {
    setState(() {
      quantity = newQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Welcome>(
        future: _sneaker,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            final shoe = snapshot.data;
            return Consumer<ProductNotifier>(
              builder: (context, productNotifier, child) {
                double totalPrice =
                    quantity * double.parse(shoe!.price.toString());

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0, right: 258),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.close, size: 30, color: Colors.black),
                            ),
                          ),
                          Container(
                            child: Text(
                              "My Cart",
                              style: appStyle(30, Colors.black, FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.94,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(15)),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Image(
                                        image: NetworkImage(widget.imageUrl.toString()),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Column(
                                  children: [
                                    Text(
                                      widget.name.toString(),
                                      style: appStyle(25, Colors.black, FontWeight.bold),
                                    ),
                                    Text(
                                      widget.category.toString(),
                                      style: appStyle(15, Colors.black, FontWeight.w400),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "\$${totalPrice.toStringAsFixed(2)}", // Display total price
                                          style: appStyle(26, Colors.black, FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Icon(Icons.delete),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        updateQuantity(quantity + 1);
                                      },
                                      child: Container(
                                        height: 25,
                                        width: 20,
                                        color: Colors.red.withOpacity(.8),
                                        child: Center(
                                          child: Text("+", style: appStyle(20, Colors.black, FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      quantity.toString(),
                                      style: appStyle(25, Colors.black, FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    GestureDetector(
                                      onTap: () {
                                        if (quantity > 1) {
                                          updateQuantity(quantity - 1);
                                        }
                                      },
                                      child: Container(
                                        height: 25,
                                        width: 20,
                                        color: Colors.blue.withOpacity(.8),
                                        child: Center(
                                          child: Text("-", style: appStyle(20, Colors.black, FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
