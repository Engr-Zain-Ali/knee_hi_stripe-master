import 'package:flutter/material.dart';
import 'dart:async'; // Import the async library for Timer

// Your existing imports...
import 'package:ecommmeranceeeee/generated/assets.dart';
import 'package:ecommmeranceeeee/services/helper.dart';
import 'package:ecommmeranceeeee/views/shared/app_style.dart';
import 'package:ecommmeranceeeee/views/shared/product_card.dart';

import '../../models/men_shoe_model/men_shoe_model.dart';
import '../shared/home_bottom_men_shoe.dart';
// Import your other widgets...

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final TabController _tabController =
  TabController(length: 3, vsync: this);
  late Future<List<Welcome>> _male;
  late Future<List<Welcome>> _female;
  late Future<List<Welcome>> _kids;

  late DateTime saleEndTime;
  late Duration timeRemaining;
  late String hoursString = '00';
  late String minutesString = '00';
  late String secondsString = '00';
  late Timer _timer;

  void startFlashSaleTimer() {
    saleEndTime = DateTime.now().add(Duration(hours: 8, minutes: 34, seconds: 52));
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        timeRemaining = saleEndTime.difference(DateTime.now());
        _updateTimeStrings();
      });

      if (timeRemaining.isNegative) {
        timer.cancel();
      }
    });
  }

  void _updateTimeStrings() {
    int hours = timeRemaining.inHours;
    int minutes = (timeRemaining.inMinutes % 60);
    int seconds = (timeRemaining.inSeconds % 60);

    hoursString = hours.toString().padLeft(2, '0');
    minutesString = minutes.toString().padLeft(2, '0');
    secondsString = seconds.toString().padLeft(2, '0');
  }

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
    startFlashSaleTimer(); // Start the flash sale timer
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ... Existing code

              // Flash sale countdown widget
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    width: 343,
                    height: 220,
                    child: Stack(
                      children: [
                        Container(
                          width: 343,
                          height: 206,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/00.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            "Super Flash Sale..\n20% Off",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 130,
                          left: 20,
                          child: Container(
                            width: 42,
                            height: 41,
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                hoursString,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 130,
                          left: 75,
                          child: Center(
                            child: Text(
                              ":",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 130,
                          left: 95,
                          child: Container(
                            width: 42,
                            height: 41,
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                minutesString,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 130,
                          left: 145,
                          child: Center(
                            child: Text(
                              ":",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 130,
                          left: 160,
                          child: Container(
                            width: 42,
                            height: 41,
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                secondsString,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height*0.630,
                child: Stack(
                  children: [
                    Container(


                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(

                          children: [
                            TabBar(
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorColor: Colors.red,
                              controller: _tabController,
                              isScrollable: true,
                              labelColor: Colors.blue,
                              labelStyle: appStyle(18, Colors.blue, FontWeight.bold),
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
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.070),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Container(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Home_Bottom_Men_Shoe(male:_male),
                              Home_Bottom_Men_Shoe(male:_female),
                              Home_Bottom_Men_Shoe(male:_kids),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

