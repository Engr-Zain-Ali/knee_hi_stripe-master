
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Phone extends StatefulWidget {
  const Phone({super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Enter your phone number",
                  labelText: "Phone Number",
                  suffixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(29),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () async {

                },
                child: Text('Verify Now'))
          ],
        ),
      ),
    );
  }
}
