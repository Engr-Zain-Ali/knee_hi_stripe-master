import 'dart:convert';
import 'package:ecommmeranceeeee/models/men_shoe_model/men_shoe_model.dart';
import 'package:flutter/services.dart';

class Helper {
  Future<List<Welcome>> getMaleSneakers() async {
    try {
      final data = await rootBundle.loadString("assets/json/men_shoes.json");
      final maleList = welcomeFromJson(data);
      return maleList.values.toList();
    } catch (error) {
      print("Error loading male sneakers data: $error");
      throw error; // Rethrow the error to propagate it to the caller
    }
  }

  Future<List<Welcome>> getFemaleSneakers() async {
    try {
      final data = await rootBundle.loadString("assets/json/women_shoes.json");
      final femaleList = welcomeFromJson(data);
      return femaleList.values.toList();
    } catch (error) {
      print("Error loading female sneakers data: $error");
      throw error;
    }
  }

  Future<List<Welcome>> getKIDSSneakers() async {
    try {
      final data = await rootBundle.loadString("assets/json/kids_shoes.json");
      final kidsList = welcomeFromJson(data);
      return kidsList.values.toList();
    } catch (error) {
      print("Error loading kids sneakers data: $error");
      throw error;
    }
  }

  Future<Welcome> getMaleSneakersById(String id) async {
    try {
      final data = await rootBundle.loadString("assets/json/men_shoes.json");
      final maleMap = welcomeFromJson(data);

      // print('from json to welcome: ${maleMap.values.first.id}');
      Welcome welcome = maleMap.values.firstWhere(
            (welcome) {
          print('id is : ${welcome.id} = $id');
          if(welcome.id == id){
            return false;
          }
          return true;

        },
      );
      print('welcome model is :: ${welcome}');
      return welcome;
    } catch (error) {
      print("Error loading male sneakers by ID: $error");
      throw error;
    }
  }

  Future<Welcome> getFemaleSneakersById(String id) async {
    try {
      final data = await rootBundle.loadString("assets/json/women_shoes.json");
      final femaleMap = welcomeFromJson(data);

      final welcome = femaleMap.values.firstWhere(
            (welcome) => welcome.id == id,
      );
      return welcome;
    } catch (error) {
      print("Error loading female sneakers by ID: $error");
      throw error;
    }
  }

  Future<Welcome> getKidsSneakersById(String id) async {
    try {
      final data = await rootBundle.loadString("assets/json/kids_shoes.json");
      final kidsMap = welcomeFromJson(data);

      final welcome = kidsMap.values.firstWhere(
            (welcome) => welcome.id == id,
        orElse: () {
          throw StateError("No element found with ID: $id");
        },
      );

      return welcome;
    } catch (error) {
      print("Error loading kids sneakers by ID: $error");
      throw error;
    }
  }
}

//yeh nichay wala purana hay
// import 'package:ecommmeranceeeee/models/men_shoe_model/men_shoe_model.dart';
// import 'package:flutter/services.dart' as the_bundle;
// import 'package:flutter/services.dart';
// class Helper {
//   // Future<Map<String, Welcome>> getMaleSneakers() async {
//   //   final data = await the_bundle.rootBundle.loadString(
//   //       "assets/json/men_shoes.json");
//   //   final maleList = welcomeFromJson(data);
//   //   return maleList;
//   // }
//   //
//   // Future<Map<String, Welcome>> getFemaleSneakers() async {
//   //   final data = await the_bundle.rootBundle.loadString(
//   //       "assets/json/women_shoes.json");
//   //   final femaleList = welcomeFromJson(data);
//   //   return femaleList;
//   // }
//   //
//   // Future<Map<String, Welcome>> getKIDSSneakers() async {
//   //   final data = await the_bundle.rootBundle.loadString(
//   //       "assets/json/kids_shoes.json");
//   //   final kidsList = welcomeFromJson(data);
//   //   return kidsList;
//   // }
//   Future<List<Welcome>> getMaleSneakers() async {
//     final data = await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
//     final maleList = welcomeFromJson(data);
//     return maleList.values.toList();
//   }
//
//   Future<List<Welcome>> getFemaleSneakers() async {
//     final data = await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");
//     final femaleList = welcomeFromJson(data);
//     return femaleList.values.toList();
//   }
//
//   Future<List<Welcome>> getKIDSSneakers() async {
//     final data = await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");
//     final kidsList = welcomeFromJson(data);
//     return kidsList.values.toList();
//   }
// //  yai kai hoe kuch bi nhi ahea,,,,, ?
//
//   // Future<Welcome>
//   getMaleSneakersById(String id) async {
//     final data = await rootBundle.loadString("assets/json/men_shoes.json");
//     final maleList = welcomeFromJson(data);
//     print("Male side");
//     print(maleList.toString());
//     // final welcome = maleList.firstWhere((welcome) => welcome.id == id);
//     // return welcome;
//   }
//   // Future<Welcome>
//   getFemaleSneakersById(String id) async {
//     final data = await rootBundle.loadString("assets/json/women_shoes.json");
//     final maleList = welcomeFromJson(data);
//     print(maleList.toString());
//
//     // // final welcome = maleList.firstWhere((welcome) => welcome.id == id);
//     // return welcome;
//   }
//   // Future<Welcome>
//   getKidsSneakersById(String id) async {
//     final data = await rootBundle.loadString("assets/json/Kids_shoes.json");
//     final maleList = welcomeFromJson(data);
//     // final welcome = maleList.firstWhere((welcome) => welcome.id == id);
//     // return welcome;
//   }
// }
//
//
