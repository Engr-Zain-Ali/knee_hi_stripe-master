
import 'package:ecommmeranceeeee/views/shared/product_card.dart';
import 'package:ecommmeranceeeee/views/shared/up_and%20down_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';


import '../../models/men_shoe_model/men_shoe_model.dart';
import '../../services/helper.dart';
import 'S_Product_All.dart';
import 'app_style.dart';

class Show_All extends StatefulWidget {
  const Show_All({Key? key}) : super(key: key);

  @override
  State<Show_All> createState() => _Show_AllState();
}

class _Show_AllState extends State<Show_All> with TickerProviderStateMixin {
  late final TabController _tabController =
  TabController(length: 3, vsync: this);
  late Future<List<Welcome>> _male;
  late Future<List<Welcome>> _female;
  late Future<List<Welcome>> _kids;

  void getMale() {
    _male = Helper().getMaleSneakers();
  }

  void getFemale() {
    _female = Helper().getFemaleSneakers();
  }

  void getKids() {
    _kids = Helper().getKIDSSneakers();
  }

  @override
  void initState() {
    super.initState();
    getMale();
    getFemale();
    getKids();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(

                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(250)),
                image: DecorationImage(
                  image: AssetImage("assets/images/2.png"),
                  fit: BoxFit.cover,
                ),
              ),
    ),
               SingleChildScrollView(
                child: Container(
                  
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0,right: 35,top:45),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.close, color: Colors.white, size: 30),
                            ),
                            GestureDetector(
                              child: Icon(Icons.tune, color: Colors.white, size: 30),
                            )
                          ],
                        ),
                      ),
                      TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.transparent,
                        controller: _tabController,
                        isScrollable: true,
                        labelColor: Colors.white,
                        labelStyle: appStyle(22, Colors.white, FontWeight.bold),
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(
                            text: "Men Shoes",
                          ),
                          Tab(
                            text: "Women Shoes",
                          ),
                          Tab(
                            text: "Kids Shoes",
                          )
                        ],
                      ),

                       Container(
                         //color: Colors.grey,

                         height: MediaQuery.of(context).size.height,
                         child:  Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: TabBarView(
                             controller: _tabController,
                             children: [
                              ProductAll(male:_male),
                               ProductAll(male:_female),
                               ProductAll(male:_kids),


                             ],
                           ),
                         ),
                       )
                    ],
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }
}
