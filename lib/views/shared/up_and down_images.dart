import 'package:ecommmeranceeeee/views/shared/app_style.dart';
import 'package:flutter/material.dart';

class StaggerTile extends StatefulWidget {
  const StaggerTile(
      {super.key,
      required this.imageUrl,
      required this.text,
      required this.price});

  final String imageUrl;
  final String text;
  final String price;

  @override
  State<StaggerTile> createState() => _StaggerTileState();
}

class _StaggerTileState extends State<StaggerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height ase kai below waley kai = dey dea full container white hoe gai ab grey colour pic mai ptea nhi keu areha hai
      // height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.withOpacity(.2),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        // yaha be use kar saktay ho lakin bahi humay kahi aur chaiye
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(
                widget.imageUrl,
              ),fit: BoxFit.contain,
            ),
            Container(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.text,
                        overflow: TextOverflow.ellipsis,
                        style:
                            appStyleHt(20, Colors.black, FontWeight.bold, 1),
                      ),
                      Text(
                        widget.price,
                        style:
                            appStyleHt(23, Colors.black, FontWeight.bold, 1),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
