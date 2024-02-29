import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelperUI {
  static Widget customTextField(TextEditingController controller, String text, IconData iconData, bool toHide) {
    return TextField(
      controller: controller,
      obscureText: toHide,
      decoration: InputDecoration(
        hintText: text,
        labelText: text,
        suffixIcon: Icon(iconData),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  static Widget customButton(VoidCallback voidCallback, String text) {
    return Container(
      width: 300,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            // Define the color based on the button state
            if (states.contains(MaterialState.pressed)) {
              // Color when the button is pressed
              return Colors.blue; // Replace with your desired color
            }
            // Default color when the button is not pressed
            return Colors.red; // Replace with your desired color
          }),
        ),
        onPressed: voidCallback,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  static Future<void> customAlertBox(String text, BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }
}
