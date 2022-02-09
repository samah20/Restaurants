import 'package:flutter/material.dart';
import 'package:restaurants/firestore/data/router_helper.dart';
import 'package:restaurants/firestore/ui/screen/LoginRegister/login_screen.dart';
import 'package:restaurants/firestore/ui/screen/LoginRegister/register_screen.dart';

class LoginRegisterScreen extends StatelessWidget {
  const LoginRegisterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage('assets/images/background.png'),
          ),
        ),
        child: SizedBox(
          height: 10,
          width: 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/logo.png"),
              const Text(
                "e-Scooter Easy,",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'assets/fonts/Cairo-VariableFont_wght.ttf'),
              ),
              const Text(
                "Your Ride Anytime.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'assets/fonts/Cairo-VariableFont_wght.ttf'),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: RaisedButton(
                    color: Colors.white,
                    // hoverColor: Colors.purple,
                    onPressed: () {
                      RouterHelper.routerHelper
                          .routingToSpecificWidget(LoginScreen());
                    },
                    child: const Text('Login',
                        style: TextStyle(color: Colors.black))),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {
                      RouterHelper.routerHelper
                          .routingToSpecificWidget(RegisterScreen());
                    },
                    child: const Text('Register',
                        style: TextStyle(color: Colors.black))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
