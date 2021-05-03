import 'package:flutter/material.dart';
import 'package:rider_app/Screens/RegisterScreen.dart';

class LoginScreen extends StatelessWidget {
  static const String screenId = "Login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 45.0,
              ),
              Image(
                image: AssetImage(
                  "images/logo.png",
                ),
                width: 350.0,
                height: 250.0,
                alignment: Alignment.center,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5.0,
                  bottom: 10.0,
                ),
                child: Text(
                  "RIDER",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                    fontFamily: "Brand Bold",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                        labelText: "Email",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("Login Button Clicked");
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.yellow[600],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18.0,
                            fontFamily: "BRAND BOLD",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  RegistrationScreen.screenId,
                  (route) => false,
                ),
                child: Text(
                  "Don't have an account ? Register Here",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
