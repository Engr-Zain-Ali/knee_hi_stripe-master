
import 'package:flutter/material.dart';


import '../views/ui/home.dart';
import 'Signip account.dart';
import 'helper_ui.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
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
        title: const Text("Sign In"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Welcome Back",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Sign in with your email and password  \nor continue with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50,),
          
              HelperUI.customTextField(emailController, "Email",Icons.email_outlined, false,),
              SizedBox(height: 10,),
              HelperUI.customTextField(passwordController, "Password", Icons.password, true),
              SizedBox(height: 30,),
              HelperUI.customButton(()=>Navigator.push(context, MaterialPageRoute(builder:(context)=>Home())), "Sign Up"),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){

                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey.withOpacity(.1),
                      child: Image(image: AssetImage('assets/images/gg.png')
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  InkWell(
                    onTap: (){
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey.withOpacity(.1),
                      child: Image(image: AssetImage('assets/images/ff.png')
          
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont have an account?",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,),),
                  SizedBox(width: 5,),
                  InkWell(
                      onTap: ()=>Navigator.push(context,MaterialPageRoute(builder:(context)=>Siginup())),
                      child: Text("SiginUp",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.red),)),
          
                ],
              )
              
          
          
          
            ],
          ),
        ),
      ),
    );
  }

}
