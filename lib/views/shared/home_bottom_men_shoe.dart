import 'package:flutter/material.dart';

import '../../models/men_shoe_model/men_shoe_model.dart';
import '../ui/product_page.dart';
import 'app_style.dart';
import 'new_shoe.dart';

import 'product_card.dart';
import 'show_all.dart';

class Home_Bottom_Men_Shoe extends StatelessWidget {
  const Home_Bottom_Men_Shoe({Key? key, required Future<List<Welcome>> male})
      : _male = male,
        super(key: key);

  final Future<List<Welcome>> _male;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //color: Colors.grey.withOpacity(.1),
          height: MediaQuery.of(context).size.height * 0.350,
          child: FutureBuilder<List<Welcome>>(
            future: _male,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else if (snapshot.data == null) {
                return Text("No data available");
              } else {
                final male = snapshot.data!;
                return ListView.builder(
                  itemCount: male.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final shoe = male[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Product_page(id: shoe.id.toString(), category: shoe.category.toString(),imageUrl: shoe.imageUrl, name: shoe.name, price: shoe.price.toString(), slug: shoe.slug,),
                        ),
                      ),
                      child: Product_Card(
                        text: "-Left behind",
                        items_left: shoe.itemsLeft.toString(),
                        name: shoe.name,
                        image: shoe.imageUrl,
                        id: shoe.id.toString(),
                        category: shoe.category.toString(),
                        price: "\$${shoe.price.toString()}",
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 18,
                top: 0,
                bottom: 18,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Shoes",
                    style: appStyle(20, Colors.black, FontWeight.bold),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Show_All()),
                        ),
                        child: Text(
                          "Show All",
                          style: appStyle(20, Colors.black, FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_sharp,
                        size: 20,
                      )
                    ],
                  ),
                ],
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              child: FutureBuilder<List<Welcome>>(
                future: _male,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else if (snapshot.data == null) {
                    return Text("No data available");
                  } else {
                    final male = snapshot.data!;
                    return ListView.builder(
                      itemCount: male.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final shoe = male[index];
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10, left: 10),
                            child: New_Shoe(imageUrl: shoe.imageUrl,),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        )
      ],
    );
  }
}
