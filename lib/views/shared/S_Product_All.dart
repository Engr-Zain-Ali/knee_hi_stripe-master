import 'package:ecommmeranceeeee/views/shared/up_and%20down_images.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../models/men_shoe_model/men_shoe_model.dart';
class ProductAll extends StatelessWidget {
  const ProductAll({super.key, required Future<List<Welcome>> male,}):_male=male;
  final Future<List<Welcome>>_male;

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<List<Welcome>>(
        future: _male,
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error${snapshot.error}");
          } else {
            final male = snapshot.data;
            return  StaggeredGridView.countBuilder(
              padding: EdgeInsets.only(left: 15,right: 15,top: 10),
              itemCount: male!.length,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              scrollDirection: Axis.vertical,
//voice ker kai bateo..?calll kar loo
              staggeredTileBuilder: (index) => StaggeredTile.extent(
                (index % 2 == 0) ? 1 : 1,
                (index % 4 == 1 || index % 4 == 3)
                    ? MediaQuery.of(context).size.height * 0.38
                    : MediaQuery.of(context).size.height * 0.39,
              ),
              itemBuilder: (context, index) {
                final shoe = snapshot.data![index];
                return StaggerTile(
                  imageUrl: shoe.imageUrl,
                  text: shoe.name,
                  price: "\$${shoe.price.toString()}",
                );
              },
            )
            ;
          }
        });
  }
}
