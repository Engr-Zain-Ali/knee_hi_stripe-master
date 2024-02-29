import 'dart:convert';

import 'package:ecommmeranceeeee/views/CartPage.dart';
import 'package:ecommmeranceeeee/views/ui/Shopping_Cart111.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../button.dart';
import '../../l000ginn/login_success/login_success_screen.dart';
import '../../models/men_shoe_model/men_shoe_model.dart';
import '../../services/helper.dart';
import '../shared/app_style.dart';
import '../shared/product_card.dart';
import '../shared/product_provider.dart';

class Product_page extends StatefulWidget {
  final String id;
  final String category;
  final String imageUrl;
  final String name;
  final String price;
  final String slug;

  const Product_page({
    super.key,
    required this.id,
    required this.category,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.slug,
  });

  @override
  State<Product_page> createState() => _Product_pageState();
}

class _Product_pageState extends State<Product_page> {
  final PageController pageController = PageController();
  late Future<Welcome> _sneaker;
  int selectedNumberIndex = -1;
  int quantity = 1; // Add quantity variable
  bool isFavorite = false; // Add favorite variable

  void getShoes() {
    if (widget.category == "Category.RUNNING" ||
        widget.category == "Category.FORMAL" ||
        widget.category == "Category.FOOTBALL" ||
        widget.category == "Category.CASUAL") {
      _sneaker = Helper().getMaleSneakersById(widget.id);
    } else if (widget.category == "Category.RUNNING" ||
        widget.category == "Category.FORMAL" ||
        widget.category == "Category.FOOTBALL" ||
        widget.category == "Category.CASUAL") {
      _sneaker = Helper().getFemaleSneakersById(widget.id);
    } else if (widget.category == "Category.RUNNING" ||
        widget.category == "Category.FORMAL" ||
        widget.category == "Category.FOOTBALL" ||
        widget.category == "Category.CASUAL") {
      _sneaker = Helper().getKidsSneakersById(widget.id);
    }
  }

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

  Map<String, dynamic>? paymentIntentData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Welcome>(
        future: _sneaker,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            print('enter in error');
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            final shoe = snapshot.data;
            return Consumer<ProductNotifier>(
              builder: (context, productNotifier, child) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      leadingWidth: 0,
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.close),
                            ),
                            // Add the favorite icon with GestureDetector
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Toggle the favorite status
                                  isFavorite = !isFavorite;
                                });
                              },
                              child: Icon(
                                Icons.favorite,
                                color: isFavorite ? Colors.grey : Colors.red,
                                size: 27,
                              ),
                            ),
                          ],
                        ),
                      ),
                      pinned: true,
                      snap: false,
                      floating: true,
                      backgroundColor: Colors.transparent,
                      expandedHeight: MediaQuery.of(context).size.height,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.59,
                              width: MediaQuery.of(context).size.width,
                              child: PageView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: shoe!.imageUrl.length,
                                controller: pageController,
                                onPageChanged: (page) {
                                  productNotifier.activepage = page;
                                },
                                itemBuilder: (context, int index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.39,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: Colors.grey.shade200,
                                        child: Image(
                                          image: NetworkImage(
                                              widget.imageUrl.toString()),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Positioned(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        right: 20,
                                        child: const Icon(
                                          Icons.favorite_outline_sharp,
                                          color: Colors.red,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        left: 0,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List<Widget>.generate(
                                            5,
                                            (index) => Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: CircleAvatar(
                                                radius: 5,
                                                backgroundColor: productNotifier
                                                            .activepage !=
                                                        index
                                                    ? Colors.grey
                                                    : Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              bottom: 30,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.65,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.name.toString(),
                                          style: appStyle(22, Colors.black,
                                              FontWeight.bold),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              widget.category.toString(),
                                              style: appStyle(16, Colors.black,
                                                  FontWeight.w400),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            RatingBar.builder(
                                              initialRating: 4,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 22,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 1),
                                              itemBuilder: (context, _) =>
                                                  const Icon(Icons.star,
                                                      color: Colors.black,
                                                      size: 18),
                                              onRatingUpdate: (rating) {
                                                // Handle the updated rating here
                                              },
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "\$${(double.parse(widget.price) * quantity).toStringAsFixed(2)}", // Update the displayed price
                                              style: appStyle(22, Colors.black,
                                                  FontWeight.bold),
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    updateQuantity(
                                                        quantity + 1);
                                                  },
                                                  child: Container(
                                                    height: 25,
                                                    width: 20,
                                                    color: Colors.red
                                                        .withOpacity(.9),
                                                    child: Center(
                                                      child: Text("+",
                                                          style: appStyle(
                                                              20,
                                                              Colors.black,
                                                              FontWeight.bold)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              quantity.toString(),
                                              style: appStyle(20, Colors.black,
                                                  FontWeight.bold),
                                            ),
                                            const SizedBox(height: 5),
                                            GestureDetector(
                                              onTap: () {
                                                if (quantity > 1) {
                                                  updateQuantity(quantity - 1);
                                                }
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 20,
                                                color:
                                                    Colors.blue.withOpacity(.9),
                                                child: Center(
                                                  child: Text("-",
                                                      style: appStyle(
                                                          20,
                                                          Colors.black,
                                                          FontWeight.bold)),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Select sizes",
                                                  style: appStyle(
                                                      22,
                                                      Colors.black,
                                                      FontWeight.bold),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  "View size guide",
                                                  style: appStyle(
                                                      16,
                                                      Colors.grey,
                                                      FontWeight.normal),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 70,
                                              child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: 9,
                                                itemBuilder: (context, index) {
                                                  double number = index + 4.0;
                                                  return GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedNumberIndex =
                                                            index;
                                                      });
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        child: Container(
                                                          width: 40,
                                                          color: selectedNumberIndex ==
                                                                  index
                                                              ? Colors.black
                                                                  .withOpacity(
                                                                      .9)
                                                              : Colors.grey
                                                                  .withOpacity(
                                                                      .9),
                                                          child: Center(
                                                            child: Text(
                                                                ' $number',
                                                                style: appStyle(
                                                                    16,
                                                                    Colors.white
                                                                        .withOpacity(
                                                                            .9),
                                                                    FontWeight
                                                                        .bold)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Column(
                                          children: [
                                            Text(
                                              widget.slug.toString(),
                                              style: appStyle(22, Colors.black,
                                                  FontWeight.bold),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              "Stylish high-top Shoe in a vibrant different hue, featuring a durable canvas upper and a contrasting white midsole for a bold and trendy .  ",
                                              style: appStyle(16, Colors.black,
                                                  FontWeight.normal),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Positioned(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 35.0),
                                            child: SizedBox(
                                              height: 40,
                                              child: Button(
                                                label: 'Buy Now',
                                                onTap: () {
                                                  makePayment();
                                                },
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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

  Future<void> makePayment() async {
    try {
      paymentIntentData = await createPaymentIntent('20', 'USD');
      //Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret:
                      paymentIntentData?['client_secret'],
                  // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
                  // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Kashif'))
          .then((value) {});

      ///now finally display payment sheeet
      await displayPaymentSheet();
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async {
        print('payment intent${paymentIntentData!['id']}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("paid successfully")),
        );
        paymentIntentData = null;
      }).onError((error, stackTrace) {
        throw Exception(error);
        // print('Error is:--->$error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ),
          context: context);
    } catch (e) {
      print('$e');
    }
  }

  String calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }

  Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      print(body);
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
        headers: {
          'Authorization':
              'Bearer sk_test_51OS2npCAGgvyZHriZlTTpFgnf2mYVrCRjBdaar9n1prhmK2TGmaxY0KZkHSVjSUQiD5HcMticG2AnXQ9rAhDVAKR00qqrWyZzv',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
      print('Create Intent response ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
      // Ensure you return a value in case of an error.
      rethrow;
    }
  }
}
