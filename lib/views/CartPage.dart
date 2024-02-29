import 'package:ecommmeranceeeee/views/shared/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/adapters.dart';

class CartPage extends StatefulWidget {
  static var imageUrl;

  CartPage({Key? key}) : super(key: key);

  final _cartBox = Hive.box('cart_box');

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> cart = [];
    final cartData = widget._cartBox.keys.map((key) {
      final item = widget._cartBox.get(key);
      return {
        'key': key,
        "id": item?['id'],
        "name": item?['name'],
        "category": item?['category'],
        "imageUrl": item?['imageUrl'],
        "price": item?['price'],
      };
    }).toList();
    cart = cartData.reversed.toList();
  
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close, color: Colors.black),
                ),
                Text(
                  "My Cart",
                  style: appStyle(36, Colors.black, FontWeight.bold),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: ListView.builder(
                    itemCount: cart.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final data = cart[index];
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            child: Slidable(
                              key: const ValueKey(0),
                              endActionPane: ActionPane(
                                motion: ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    flex: 1,
                                    onPressed: null,
                                    backgroundColor: Colors.grey.withOpacity(.3),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  )
                                ],
                              ),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.11,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.2),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(.5),
                                      spreadRadius: 5,
                                      blurRadius: 0.3,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Image(
                                            image: NetworkImage(data['imageUrl']),
                                            width: 70,
                                            height: 70,
                                            fit: BoxFit.fill,
                                          ),

                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 12, left: 20),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data['name'],
                                                style: appStyle(16, Colors.black, FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );

                      }
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
