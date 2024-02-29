import 'package:ecommmeranceeeee/provider_statemanagement/main_screen_provider_pagechanger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 18.0,left: 5,right: 10),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildNavItem(mainScreenNotifier, 0, Icons.home, "Home"),
                  buildNavItem(mainScreenNotifier, 1, Icons.search, "Search"),
                  buildNavItem(mainScreenNotifier, 2, Icons.chat, "Chat"),
                  buildNavItem(mainScreenNotifier, 3, Icons.person, "Profile"),

                ],
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildNavItem(MainScreenNotifier mainScreenNotifier, int pageIndex, IconData icon, String text) {
    return GestureDetector(
      onTap: () {
        mainScreenNotifier.pageIndex = pageIndex;
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: mainScreenNotifier.pageIndex == pageIndex ? Colors.white : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Row(
          children: [
            Hero(
              tag: 'icon$pageIndex',
              child: Icon(
                icon,
                color: mainScreenNotifier.pageIndex == pageIndex ? Colors.white : Colors.grey,
              ),
            ),
            SizedBox(width: 8),
            if (mainScreenNotifier.pageIndex != pageIndex)
              Text(
                text,
                style: TextStyle(
                  color: mainScreenNotifier.pageIndex == pageIndex ? Colors.white : Colors.grey,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
