import 'package:ecommmeranceeeee/views/ui/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'helper_ui.dart';

class Siginup extends StatefulWidget {
  const Siginup({Key? key}) : super(key: key);

  @override
  State<Siginup> createState() => _SiginupState();
}

class _SiginupState extends State<Siginup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ConpasswordController = TextEditingController();

  void siginup(String email, String password) async {
    if (email == "" || password == "") {
      HelperUI.customAlertBox('Enter The required Fields', context);
    } else {
      // Perform any other necessary actions here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16),
              Text(
                "Complete Profile",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Text(
                "Complete your details or continue \nwith social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              HelperUI.customTextField(
                emailController,
                "Email",
                Icons.email_outlined,
                false,
              ),
              SizedBox(height: 10),
              HelperUI.customTextField(
                passwordController,
                "Password",
                Icons.password,
                true,
              ),
              SizedBox(height: 10),
              HelperUI.customTextField(
                ConpasswordController,
                "Confirm Password",
                Icons.password,
                true,
              ),
              SizedBox(height: 30),
              HelperUI.customButton(()=>Navigator.push(context, MaterialPageRoute(builder:(context)=>Home())), "Sign Up"),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                    //  FirebaseService.signInwithGoogle(context);
                    },
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.grey.withOpacity(.1),
                      child: Image(image: AssetImage('assets/images/gg.png')),
                    ),
                  ),
                  SizedBox(width: 20),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.grey.withOpacity(.1),
                    child: Image(image: AssetImage('assets/images/ff.png')),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                   onTap: (){
                   },
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.grey.withOpacity(.1),
                      child: Image(image: AssetImage('assets/images/ff.png')),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'By continuing you confirm that you agree \nwith our Terms and Conditions',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
